include <../../EuroPanelMaker/panel.scad>

hp = 8;
title = "OUTPUT";
margin = 0; // Add extra width on each side for support

jacks = [
    
    [2, 55, "In"],
    [2, 15, "Outs"],
    [4, 15, ""],
    [6, 15, ""]
]; // x (in HP column), y (mm), label, rotation (degrees)

speakers = [
]; // x (in HP column), y (mm), speaker hole diameter, mount diameter, distance between two opposite screws

pots_rd901f = [
    [5, 35, "Gain"]
];

circular_holes = [[4, 90, 35]];
panel_flipped = false;
generatePanel();
