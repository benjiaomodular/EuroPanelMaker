#!/usr/bin/env python3
"""Render and check the EuroPanelMaker test panels.

Renders every tests/*.scad file to tests/output/<name>.png with OpenSCAD and
then, depending on the mode:

  --show    makes a collage of all renders and opens it (like tests.sh)
  --check   compares each render with tests/expected/<name>.png
  --update  replaces the reference images in tests/expected/

With --geometry, --check and --update also export each test to a mesh and
check its volume, centroid and bounding box against tests/expected/<name>.json.
This is slower, but unlike the images it does not depend on fonts, graphics
drivers or anti-aliasing. It only covers the printable panel, not the
components that are drawn transparently in the previews.

Only the Python standard library is used. External tools: OpenSCAD and
ImageMagick (version 6 or 7).

Exit status: 0 if everything passed, 1 if a test failed, 2 on a setup error.
"""

import argparse
import concurrent.futures
import os
import platform
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

TESTS_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = TESTS_DIR / "output"
EXPECTED_DIR = TESTS_DIR / "expected"

DEFAULT_FUZZ = "10%"
DEFAULT_MAX_PIXELS = 20

# Tolerances for --geometry. OpenSCAD writes mesh vertices with six
# significant digits, so the numbers can vary slightly between platforms.
# Moving a 6 mm hole by 0.1 mm in a 4 HP panel shifts the centroid ~0.005 mm.
VOLUME_TOLERANCE = 1e-6  # relative
CENTROID_TOLERANCE = 5e-4  # mm
BBOX_TOLERANCE = 1e-3  # mm


class SetupError(Exception):
    pass


def find_openscad(override):
    """Return the OpenSCAD command: --openscad, $OPENSCAD, PATH, then
    the usual install locations on Windows and macOS."""
    candidates = []
    if override:
        candidates.append(override)
    elif os.environ.get("OPENSCAD"):
        candidates.append(os.environ["OPENSCAD"])
    else:
        # On Windows, openscad.com is the console wrapper that passes output
        # through to us; openscad.exe works too but may print nothing.
        candidates += ["openscad.com", "openscad"]
        system = platform.system()
        if system == "Windows":
            for env in ("ProgramFiles", "ProgramFiles(x86)"):
                base = os.environ.get(env)
                if base:
                    candidates.append(str(Path(base) / "OpenSCAD" / "openscad.com"))
                    candidates.append(str(Path(base) / "OpenSCAD" / "openscad.exe"))
        elif system == "Darwin":
            candidates.append("/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD")

    for candidate in candidates:
        path = shutil.which(candidate)
        if path:
            return path
    if override or os.environ.get("OPENSCAD"):
        raise SetupError(f"OpenSCAD not found at '{candidates[0]}'")
    raise SetupError("OpenSCAD not found. Install it, or pass --openscad PATH "
                     "or set the OPENSCAD environment variable.")


def find_imagemagick():
    """Return a function that builds an ImageMagick command line.

    ImageMagick 7 has a single 'magick' binary ('magick compare ...');
    ImageMagick 6 has separate 'compare' and 'montage' binaries.
    """
    magick = shutil.which("magick")
    if magick:
        return lambda tool: [magick, tool]
    if shutil.which("compare") and shutil.which("montage"):
        return lambda tool: [shutil.which(tool)]
    raise SetupError("ImageMagick not found (need 'magick', or 'compare' "
                     "and 'montage').")


def find_tests(patterns):
    tests = sorted(TESTS_DIR.glob("*.scad"))
    if patterns:
        tests = [t for t in tests if any(p in t.stem for p in patterns)]
    if not tests:
        raise SetupError("No matching tests found.")
    return tests


MESSAGE_RE = re.compile(r"^(ERROR|WARNING):.*$", re.MULTILINE)


def render(openscad, scad, out):
    """Render one test to an image or a mesh, depending on the file name of
    'out'. Returns a list of problems (empty if it went well)."""
    out.unlink(missing_ok=True)
    proc = subprocess.run([openscad, "-o", str(out), str(scad)],
                          stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                          text=True, errors="replace", cwd=TESTS_DIR)
    problems = [m.group(0) for m in MESSAGE_RE.finditer(proc.stdout)]
    crashed = []
    if proc.returncode != 0:
        crashed.append(f"OpenSCAD exited with code {proc.returncode}")
    if not out.exists() or out.stat().st_size == 0:
        crashed.append(f"OpenSCAD did not write {out.name}")
    if crashed:
        problems += crashed
        if (out.suffix == ".png" and platform.system() == "Linux"
                and not os.environ.get("DISPLAY")
                and not os.environ.get("WAYLAND_DISPLAY")):
            problems.append("(no display found: OpenSCAD needs one to render "
                            "PNGs, try running under 'xvfb-run -a')")
        last_lines = proc.stdout.strip().splitlines()[-5:]
        problems += ["  " + line for line in last_lines]
    return problems


def compare(im, expected, actual, diff, fuzz, max_pixels):
    """Compare two images. Returns a list of problems (empty if similar) and
    a note about small differences within the tolerance."""
    if not expected.exists():
        return [f"no reference image {expected.relative_to(TESTS_DIR.parent)} "
                "(run with --update to create it)"], ""
    diff.unlink(missing_ok=True)
    proc = subprocess.run(im("compare") + ["-metric", "AE", "-fuzz", fuzz,
                                           str(expected), str(actual), str(diff)],
                          stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                          text=True, errors="replace")
    # The metric is written to stderr, e.g. "123" (IM6) or "123 (0.0019)" (IM7).
    # Exit status is 0 for similar, 1 for dissimilar and 2 for errors such as
    # images of different sizes.
    match = re.match(r"\s*([0-9.eE+-]+)", proc.stderr)
    if proc.returncode > 1 or not match:
        return [f"ImageMagick compare failed: {proc.stderr.strip()}"], ""
    pixels = float(match.group(1))
    if pixels > max_pixels:
        return [f"{pixels:.0f} pixels differ (fuzz {fuzz}, allowed "
                f"{max_pixels}), see {diff.relative_to(TESTS_DIR.parent)}"], ""
    diff.unlink(missing_ok=True)
    return [], f"({pixels:.0f} pixels differ)" if pixels else ""


def mesh_stats(off):
    """Volume, centroid and bounding box of a closed mesh in OFF format."""
    tokens = off.read_text().split()
    if tokens[0] != "OFF":
        raise ValueError(f"{off} is not an OFF file")
    n_vertices, n_faces = int(tokens[1]), int(tokens[2])
    numbers = iter(tokens[4:])
    vertices = [(float(next(numbers)), float(next(numbers)), float(next(numbers)))
                for _ in range(n_vertices)]
    volume = 0.0
    moment = [0.0, 0.0, 0.0]
    for _ in range(n_faces):
        face = [vertices[int(next(numbers))] for _ in range(int(next(numbers)))]
        # Split the face into triangles, and each triangle and the origin
        # into a tetrahedron with a signed volume.
        a = face[0]
        for b, c in zip(face[1:-1], face[2:]):
            v = (a[0] * (b[1] * c[2] - b[2] * c[1])
                 - a[1] * (b[0] * c[2] - b[2] * c[0])
                 + a[2] * (b[0] * c[1] - b[1] * c[0])) / 6
            volume += v
            for k in range(3):
                moment[k] += v * (a[k] + b[k] + c[k]) / 4
    if not vertices or volume == 0:
        raise ValueError(f"{off} has no volume")
    return {
        "volume": round(volume, 6),
        "centroid": [round(m / volume, 6) for m in moment],
        "bbox_min": [min(p[k] for p in vertices) for k in range(3)],
        "bbox_max": [max(p[k] for p in vertices) for k in range(3)],
    }


def compare_geometry(expected_file, actual):
    """Compare mesh stats with a reference file. Returns a list of problems."""
    if not expected_file.exists():
        return [f"no reference {expected_file.relative_to(TESTS_DIR.parent)} "
                "(run with --update --geometry to create it)"]
    expected = json.loads(expected_file.read_text())
    problems = []
    if abs(actual["volume"] - expected["volume"]) > VOLUME_TOLERANCE * abs(expected["volume"]):
        problems.append(f"volume is {actual['volume']}, expected {expected['volume']}")
    for key, tolerance in (("centroid", CENTROID_TOLERANCE),
                           ("bbox_min", BBOX_TOLERANCE), ("bbox_max", BBOX_TOLERANCE)):
        if any(abs(a - e) > tolerance for a, e in zip(actual[key], expected[key])):
            problems.append(f"{key} is {actual[key]}, expected {expected[key]}")
    return problems


def open_file(path):
    system = platform.system()
    if system == "Windows":
        os.startfile(path)  # noqa: only exists on Windows
    elif system == "Darwin":
        subprocess.run(["open", str(path)])
    else:
        subprocess.run(["xdg-open", str(path)])


def main():
    parser = argparse.ArgumentParser(
        description="Render and check the EuroPanelMaker test panels.")
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--show", action="store_true",
                      help="render all tests and open a collage of them")
    mode.add_argument("--check", action="store_true",
                      help="render all tests and compare with tests/expected/")
    mode.add_argument("--update", action="store_true",
                      help="render all tests and replace tests/expected/")
    parser.add_argument("tests", nargs="*", metavar="NAME",
                        help="only run tests whose name contains NAME")
    parser.add_argument("--openscad", metavar="PATH",
                        help="OpenSCAD binary (default: $OPENSCAD or "
                             "'openscad' on the PATH)")
    parser.add_argument("--fuzz", default=DEFAULT_FUZZ,
                        help="colour distance at which two pixels count as "
                             f"different (default: {DEFAULT_FUZZ})")
    parser.add_argument("--max-pixels", type=int, default=DEFAULT_MAX_PIXELS,
                        help="number of differing pixels allowed per image "
                             f"(default: {DEFAULT_MAX_PIXELS})")
    parser.add_argument("--geometry", action="store_true",
                        help="with --check or --update: also check the volume, "
                             "centroid and bounding box of each panel (slow)")
    parser.add_argument("--no-open", action="store_true",
                        help="with --show: write the collage but do not open it")
    parser.add_argument("-j", "--jobs", type=int, default=os.cpu_count() or 1,
                        help="number of parallel renders (default: CPU count)")
    args = parser.parse_args()

    try:
        openscad = find_openscad(args.openscad)
        im = find_imagemagick() if not args.update else None
        tests = find_tests(args.tests)
    except SetupError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 2

    OUTPUT_DIR.mkdir(exist_ok=True)
    if args.update:
        EXPECTED_DIR.mkdir(exist_ok=True)

    def run_one(scad):
        name = scad.stem
        png = OUTPUT_DIR / f"{name}.png"
        problems = render(openscad, scad, png)
        note = ""
        if not problems and args.check:
            problems, note = compare(im, EXPECTED_DIR / f"{name}.png", png,
                               OUTPUT_DIR / f"{name}-diff.png",
                               args.fuzz, args.max_pixels)
        if not problems and args.update:
            shutil.copyfile(png, EXPECTED_DIR / f"{name}.png")
        if args.geometry and not args.show:
            off = OUTPUT_DIR / f"{name}.off"
            mesh_problems = render(openscad, scad, off)
            if not mesh_problems:
                stats = mesh_stats(off)
                (OUTPUT_DIR / f"{name}.json").write_text(json.dumps(stats, indent=2) + "\n")
                if args.check:
                    mesh_problems = compare_geometry(EXPECTED_DIR / f"{name}.json", stats)
                elif not problems:
                    shutil.copyfile(OUTPUT_DIR / f"{name}.json", EXPECTED_DIR / f"{name}.json")
            problems += mesh_problems
        return name, problems, note

    print(f"Rendering {len(tests)} tests with {openscad}")
    failed = []
    with concurrent.futures.ThreadPoolExecutor(max(1, args.jobs)) as pool:
        for name, problems, note in pool.map(run_one, tests):
            print(f"{'FAIL' if problems else 'ok  '}  {name} {note}".rstrip())
            for problem in problems:
                print(f"      {problem}")
            if problems:
                failed.append(name)

    if args.show:
        collage = OUTPUT_DIR / "out.png"
        pngs = [str(OUTPUT_DIR / f"{t.stem}.png") for t in tests
                if (OUTPUT_DIR / f"{t.stem}.png").exists()]
        if pngs:
            subprocess.run(im("montage") + ["-density", "300", "-tile", "4x0",
                                            "-geometry", "+5+50"]
                           + pngs + [str(collage)], check=True)
            print(f"Collage written to {collage}")
            if not args.no_open:
                open_file(collage)

    print()
    if failed:
        print(f"{len(failed)} of {len(tests)} tests FAILED: {', '.join(failed)}")
        return 1
    verb = {True: "updated", False: "passed"}[args.update]
    print(f"All {len(tests)} tests {verb}.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
