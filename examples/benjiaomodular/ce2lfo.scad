include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "CE2LFO";
text_depth = 1.6;
title_font_size = 3.2;

pots = [
    [2, 110, ""],
    [2, 65, "Sqr LVL"],
    [2, 40, "Tri LVL"]];

leds = [
    [3.4, 88, 3]];

jacks = [
    [1, 14, "Tri"],
    [3, 14, "Sqr"]];

toggle_switches = [
    [2, 88, "Rate"],
];

panel_flipped = true;
generatePanel();
