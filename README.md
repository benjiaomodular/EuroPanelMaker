# EuroPanelMaker

![GitHub Releases](https://img.shields.io/github/release/benjiaomodular/EuroPanelMaker?sort=date)

Eurorack panel generator for OpenSCAD by [@benjiaomodular](https://www.instagram.com/benjiaomodular/).

![Template preview](preview.png)

I talked about how and why I developed this library on my Youtube channel. Sponsored by [PCBWay](https://pcbway.com)!

[![Watch the video](https://img.youtube.com/vi/8PgxXPMlfh4/0.jpg)](https://youtu.be/8PgxXPMlfh4)

## How to use

### Installing

Copy the `EuroPanelMaker` folder into your project directory.

![Project dir](projectdir.png)

### Importing

Include the `panel.scad` file into your project.
```
include <EuroPanelMaker/panel.scad>
```

### Basic Usage

First, define the mandatory variables.
```
hp = 4;
title = "VCA";
```

Then, define any potentiometers, jacks, switches, and LEDs you need.
```
pots = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];

pots_rd901f = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];

jacks = [
    [x (in HP column), y (mm), label, size, rotation (degrees)]
];

// MTS-102
switches = [
    [x (in HP column), y (mm), label above, label below, rotation (degrees)]
];

switches_sr16 = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];

leds = [
    [x (in HP column), y (mm), diameter (mm)]
];

keys = [
    [x (in HP column, y (mm), label)],
];

rectangular_holes = [
    [x, y, inner_width (mm), inner_height (mm), outer_width (mm), outer_height (mm)]
];

speakers = [
    [x (in HP column), y (mm), speaker hole diameter, mount diameter, distance between two opposite screws]
];

circular_holes = [
    [x, y, diameter]
];

spacers = [
    [x, y, size (2, 2.5, 3, 4, 5, 6)]
];
```

Add as many components as necessary in each array. Some notes:

- The rotation parameter on any component can be omitted for no rotation
- The options for jack size is `"35mm"` (for 3.5mm) or `"14in"` (for 1/4 inch) - if omitted, then it will be 3.5mm
- The label below parameter for a switch can be omitted for no label below the switch

Finally, generate the panel.
```
generatePanel();
```
The panel can also be flipped to be exported for printing.
```
panel_flipped = true;
```

### Advanced Usage
A number of variables can be altered. Here is a list with their default values:
```
margin = 0;
text_depth = 1.4;
title_font_size = 4.5;
title_font = "Overpass:style=Bold";
label_font = "Overpass:style=Bold";
label_font_size = 3;
pot_label_distance = 12;
pot_label_font_size = 3;
jack_label_distance = 8;
jack_label_font_size = 3;
toggle_label_distance = 12;
toggle_label_font_size = 3;
key_label_distance = 14;
key_label_font_size = 3;
```

Additionally, extra labels can be added to the panel.
```
labels = [
    [x (in HP column), y (mm), label, rotation (degrees)]
];
```

Each component also has an alternative form where the x-coordinate can be defined by millimeters as opposed to HP. This can be accomplished by adding `_mm` to the end of the component name.

## Examples
You can use `template.scad` as a starting point for your project.

I have included my own panels under `examples/benjiaomodular` for reference. Feel free to add a folder and submit a pull request if you'd like to include your own panels. 

### benjiaomodular
| Name   |      SCAD file      | Preview |
|----------|:-------------:|:------:|
| bong0 | [bong0.scad](examples/benjiaomodular/bong0.scad) | ![Bong0 Preview](examples/benjiaomodular/bong0.png) |
| ce2lfo | [ce2lfo.scad](examples/benjiaomodular/ce2lfo.scad) | ![CE2LFO Preview](examples/benjiaomodular/ce2lfo.png) |
| gate2trig | [gate2trig.scad](examples/benjiaomodular/gate2trig.scad) | ![Gate2Trig Preview](examples/benjiaomodular/gate2trig.png)|
| oras | [oras.scad](examples/benjiaomodular/oras.scad) | ![Oras Preview](examples/benjiaomodular/oras.png)|
| squares | [squares.scad](examples/benjiaomodular/squares.scad) | ![Squares Preview](examples/benjiaomodular/squares.png)|
| vca | [vca.scad](examples/benjiaomodular/vca.scad) | ![VCA Preview](examples/benjiaomodular/vca.png)|
| wavefolder | [wavefolder.scad](examples/benjiaomodular/wavefolder.scad) | ![Wavefolder Preview](examples/benjiaomodular/wavefolder.png)|


## Contributing

Some helpful tips for contributing to the EuroPanelMaker library. 

TODO: Add guidelines.

### Visual Tests
The panels in `tests/*.scad` exercise the features of the library. The script `tests/run_tests.py` renders them to `tests/output/` and works on Linux, Windows and macOS. It needs Python 3, [OpenSCAD](https://openscad.org/) and [ImageMagick](https://imagemagick.org/) (version 6 or 7).

To look at the renders, run:

```
python3 tests/run_tests.py --show
```

(`./tests.sh` does the same.) A collage like this one opens in your default image viewer:

![docs/example-out.png](docs/example-out.png)

Look out for misaligned or suspicious renderings. Individual SCAD files are available under `tests/` for further investigation.

To compare the renders with the reference images in `tests/expected/`, run:

```
python3 tests/run_tests.py --check
```

A test fails if OpenSCAD reports an error or a warning, or if its image differs from the reference. For each image that differs, a difference image `tests/output/<name>-diff.png` shows the changed pixels in red. GitHub Actions runs this check on every push and pull request, and uploads the renders and difference images when it fails.

The reference images are rendered in the same environment as on GitHub Actions (Ubuntu 24.04, OpenSCAD 2021.01). Other OpenSCAD versions or graphics drivers can give small differences; `--fuzz` and `--max-pixels` adjust the tolerance. If a change to the library is supposed to change the renders, update the reference images with `--update`, check the new images and commit them.

Other options:
- `python3 tests/run_tests.py --check jack` only runs the tests whose name contains `jack`.
- `--openscad PATH`, or the `OPENSCAD` environment variable, selects the OpenSCAD binary.
- On Linux without a display (e.g. over SSH), run the script under `xvfb-run -a`.
- `--help` lists all options.
