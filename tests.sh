#!/bin/bash

mkdir -p tests/output

for i in tests/*.scad
do
  f=$(basename -- ${i%.*})
  echo "Working on $f..."
  openscad -o tests/output/$f.png tests/$f.scad 
done

montage -density 300 -tile 4x0 -geometry +5+50 tests/output/test-*.png tests/output/out.png
display tests/output/out.png