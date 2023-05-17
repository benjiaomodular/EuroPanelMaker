include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "NOISE";
text_depth = 1.4;
title_font_size = 4;
margin = 3;

pots = [[2, 95, "Level"]];

leds = [];

jacks = [
    [2, 60, "White"],
    [2, 40, "Pink"],
    [2, 20, "Blue"]];

panel_flipped = false;
generatePanel();
