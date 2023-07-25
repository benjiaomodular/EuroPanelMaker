include <../EuroPanelMaker/panel.scad>


hp = 4;
title = "POT1";
margin = 0; // Add extra width on each side for support

pots = [
    [2, 60, "POT", 180]]; // x (in HP column), y (mm), label, rotation (degrees)

leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = []; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = true;
generatePanel();
