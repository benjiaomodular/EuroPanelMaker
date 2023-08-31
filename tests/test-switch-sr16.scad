include <../EuroPanelMaker/panel.scad>


hp = 4;
title = "SR16";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)
leds = []; // x (in HP column), y (mm), diameter (mm)
jacks = []; // x (in HP column), y (mm), label, rotation (degrees)
switches_sr16 = [
    [2, 100, "0"],
    [2, 70, "90", 90],
];

switches_sr16_mm = [
    [10, 40, "mm", 180],
];

generatePanel();
