#!/bin/bash

mkdir -p output

for i in *.scad
do
  f=${i%.*}
  echo "Working on $f file..."
  openscad -o output/$f.png $f.scad 
done

montage -density 300 -tile 4x0 -geometry +5+50 output/test-*.png output/out.png
