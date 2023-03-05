include <../../EuroPanelMaker/panel.scad>

hp = 2;
title = "G2T";
text_depth = 1.6;
title_font_size = 3.2;

pots=false;
leds = [
    [1, 50, 5],
    [1, 60, 5],
    [1, 70, 5]];

jacks = [
    [1, 35, "G"],
    [1, 18, "T"],
    [1, 102, "G"],
    [1, 85, "T"]];

panel_flipped = false;

generatePanel();
