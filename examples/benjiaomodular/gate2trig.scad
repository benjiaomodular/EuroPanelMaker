include <../../EuroPanelMaker/panel.scad>

hp = 3;
title = "G2T";
text_depth = 1.6;
title_font_size = 3.2;

pots=false;
leds = [
    [1.5, 50, 5],
    [1.5, 60, 5],
    [1.5, 70, 5]];

jacks = [
    [1.5, 35, "G"],
    [1.5, 18, "T"],
    [1.5, 102, "G"],
    [1.5, 85, "T"]];

panel_flipped = false;

generatePanel();
