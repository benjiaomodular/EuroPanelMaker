include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "ORAS";
text_depth = 1.6;
title_font_size = 3.8;

pots = [
    [2, 95, "Bilis"],
    [2, 70, "Tagal"]];

leds = [
    [3, 48, 5],
    [3, 38, 5],
    [3, 28, 5],
    [3, 18, 5]];

jacks = [
    [1, 48, "", "35mm", -90],
    [1, 38, "", "35mm", -90],
    [1, 28, "", "35mm", -90],
    [1, 18, "", "35mm", -90],];

panel_flipped = false;
generatePanel();
