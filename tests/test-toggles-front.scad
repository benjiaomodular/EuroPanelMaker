include <../EuroPanelMaker/panel.scad>


hp = 6;
title = "TOGGLE";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)
leds = []; // x (in HP column), y (mm), diameter (mm)
jacks = []; // x (in HP column), y (mm), label, rotation (degrees)
toggle_switches = [
    [3, 100, ""],
    [3, 70, "LABEL A"],
    [3, 30, "LABEL A", "LABEL B"],
];
panel_flipped = false;
generatePanel();
