include <../EuroPanelMaker/panel.scad>

hp = 20;
title = "SPEAKER";
margin = 0; // Add extra width on each side for support

jacks = [
    [2, 17]
]; // x (in HP column), y (mm), label, rotation (degrees)
speakers = [
    [10, 65, 75, 92]
]; // x (in HP column), y (mm), label, rotation (degrees)

pots_rd901f = [
    [18, 17]
];

panel_flipped = false;
generatePanel();
