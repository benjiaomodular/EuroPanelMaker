include <../EuroPanelMaker/panel.scad>


hp = 4;
title = "901";
margin = 0; // Add extra width on each side for support

pots_rd901f = [
    [2, 100, "0"],
    [2, 80, "90", 90],
    [2, 60, "180", 180],]; // x (in HP column), y (mm), label, rotation (degrees)

pots_rd901f_mm = [
    [10, 20, "mm"]];
    
leds = []; // x (in HP column), y (mm), diameter (mm)

jacks = []; // x (in HP column), y (mm), label, rotation (degrees)

panel_flipped = false;
generatePanel();
