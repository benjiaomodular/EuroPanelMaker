include <../../EuroPanelMaker/panel.scad>

hp = 6;
title = "BUTTONS";
text_depth = 1.6;
title_font_size = 3.2;

pots= [[3, 95, "CH 1-2"]];
leds = [
    [2, 25, 7],
    [2, 48, 7],
    [2, 71, 7],
    [4, 25, 3],
    [4, 48, 3],
    [4, 71, 3],
    
];

jacks = [
    [4, 15, ""],
    [4, 38, ""],
    [4, 61, ""]];

panel_flipped = false;

generatePanel();
