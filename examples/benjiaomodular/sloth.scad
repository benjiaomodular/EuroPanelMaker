include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "SLOTH";
text_depth = 1.4;
title_font_size = 3.8;

pots_rd901f = [
    [2, 90, "torpor"]];

leds = [
    [2, 70, 3]
];

jacks = [
    [2, 35, "big", "35mm", 180],
    [2, 15, "smol"]];

panel_flipped = false;
generatePanel();
