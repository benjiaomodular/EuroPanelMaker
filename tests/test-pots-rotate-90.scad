include <../EuroPanelMaker/panel.scad>


hp = 6;
title = "POT2";
margin = 0; // Add extra width on each side for support

pots = [
    [2, 60, "POT", 90]]; // x (in HP column), y (mm), label, rotation (degrees)

leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = []; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = true;
generatePanel();
