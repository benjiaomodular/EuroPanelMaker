include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "ENV";
text_depth = 1.2;
title_font_size = 3.2;
margin = 2;

pots = [
    [2, 95, "ATK"],
    [2, 70, "REL"]];


leds = [
    [2, 50, 3]];

jacks = [
    [2, 36, "IN", 180],
    [2, 16, "OUT"]];



panel_flipped = false;
generatePanel();
