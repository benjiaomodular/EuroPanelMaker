#!/bin/bash
# Renders all tests and shows them in a collage for visual inspection.
# Kept for compatibility; see tests/run_tests.py --help for more options.
exec python3 "$(dirname "$0")/tests/run_tests.py" --show "$@"
