include <../EuroPanelMaker/panel.scad>


hp = 2;
title = "2";
margin = 0; // Add extra width on each side for support

pots = []; // x (in HP column), y (mm), label, rotation (degrees)

leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = []; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = false;
generatePanel();
