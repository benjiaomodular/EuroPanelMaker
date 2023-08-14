include <../../EuroPanelMaker/panel.scad>

hp = 6;
title = "RANDOM";
text_depth = 1.6;
title_font_size = 3.8;
margin = 3;

pots = [
    [2, 105, ""],
    [2, 75, ""]];

leds = [
    [5, 105, 6],
    [5, 75, 6],
    [2, 55, 5],
    [5, 55, 5]];

jacks = [
    [2, 43, "1", "35mm", 90],
    [5, 43, "2", "35mm", 180],
    [2, 33, "", "35mm", 90],
    [2, 23, "", "35mm", 90],
    [5, 23, "CV"]];

labels = [
    [0.5, 32, "CLK"],
    [1, 16, "Noise"],
];
panel_flipped = false;
generatePanel();
