include <../EuroPanelMaker/panel.scad>


hp = 2;
title = "S";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)
leds = []; // x (in HP column), y (mm), diameter (mm)
jacks = []; // x (in HP column), y (mm), label, rotation (degrees)
switches = [];

spacers = [
    [1, 100, 3]
];

spacers_mm = [
    [5, 80, 3]
];


panel_flipped = false;
generatePanel();
