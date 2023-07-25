include <../EuroPanelMaker/panel.scad>


hp = 6;
title = "POT1";
margin = 0; // Add extra width on each side for support

pots = [
    [3, 100, "0"],
    [3, 60, "90", 90],
    [3, 20, "180", 180],]; // x (in HP column), y (mm), label, rotation (degrees)

leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = []; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = false;
generatePanel();
