include <../EuroPanelMaker/panel.scad>


hp = 6;
title = "TOGGLE";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)
leds = []; // x (in HP column), y (mm), diameter (mm)
jacks = []; // x (in HP column), y (mm), label, rotation (degrees)
switches = [
    [3, 100, "0"],
    [3, 60, "90", 90],
    [3, 20, "180", 180],
];
panel_flipped = true;
generatePanel();
