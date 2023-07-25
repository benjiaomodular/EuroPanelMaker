include <../EuroPanelMaker/panel.scad>


hp = 4;
title = "4";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)

leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = []; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = false;
generatePanel();
