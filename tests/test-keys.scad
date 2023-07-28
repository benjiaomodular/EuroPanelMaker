include <../EuroPanelMaker/panel.scad>


hp = 6;
title = "KEYS";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)
leds = []; // x (in HP column), y (mm), diameter (mm)
jacks = []; // x (in HP column), y (mm), label, rotation (degrees)
keys = [
    [3, 100, ""],
    [3, 70, "KEY HP"],
];
keys_mm = [
    [15, 40, "KEY MM"],
];
panel_flipped = false;
generatePanel();
