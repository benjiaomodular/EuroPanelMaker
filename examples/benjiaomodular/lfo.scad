include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "MiniLFO";
text_depth = 1.2;
title_font_size = 3.2;
pot_label_distance = -14;
margin = 2;

pots = [
    [2, 105, "RATE"],
    [2, 78, "RANGE"]];

toggle_switches = [
    [2, 51, ""],
];

leds = [
    [2, 38, 3],
    [2, 32, 3],];

jacks = [
    [2, 20, ""]];



panel_flipped = false;
generatePanel();
