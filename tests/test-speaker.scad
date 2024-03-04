include <../EuroPanelMaker/panel.scad>

hp = 20;
title = "";
margin = 0; // Add extra width on each side for support

jacks = [
]; // x (in HP column), y (mm), label, rotation (degrees)

speakers = [
    [10, 65, 70, 95, 83]
]; // x (in HP column), y (mm), speaker hole diameter, mount diameter, distance between two opposite screws

pots_rd901f = [
];

panel_flipped = false;
generatePanel();
