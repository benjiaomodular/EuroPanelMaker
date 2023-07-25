include <../EuroPanelMaker/panel.scad>


hp = 4;
title = "JACK";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)

leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = [
    [1, 80, "J1"],
    [3, 80, "J2"],
    [1, 50, "J3", 180],
    [3, 50, "J4", 180],
    [1, 20, "J5", -90]
]; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = false;
generatePanel();
