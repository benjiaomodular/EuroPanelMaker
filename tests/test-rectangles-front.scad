include <../EuroPanelMaker/panel.scad>


hp = 8;
title = "RECT";
margin = 2; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)
leds = []; // x (in HP column), y (mm), diameter (mm)
jacks = []; // x (in HP column), y (mm), label, rotation (degrees)


rectangular_holes = [
    [4, 100, 25, 12, 40, 15]
];

rectangular_holes_mm = [
    [20, 70, 25, 20, 40, 40]
];

panel_flipped = false;
generatePanel();
