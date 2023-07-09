include <../../EuroPanelMaker/panel.scad>

hp = 10;
title = "SAMPLER";
text_depth = 1.6;
title_font_size = 3.2;

pots= [
    [3, 100, "PITCH"],
    [3, 75, "OUTPUT"],
    [7, 75, "THRU"],
    ];
    
leds = [
    [5, 35, 3],
    [3, 50, 11],
    [7, 50, 7],
    [3, 25, 10],
];

jacks = [
    [6, 15, "IN"],
    [8, 15, "OUT"]];

labels = [
    [7, 110, "LOOP"],,
    [3, 60, "REC"],
    [7, 60, "TRIG"]];

toggle_switches = [
    [7, 100],
    [7, 35],
];

panel_flipped = false;

generatePanel();
