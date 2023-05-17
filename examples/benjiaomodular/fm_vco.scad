include <../../EuroPanelMaker/panel.scad>

hp = 6;
title = "FM VCO";
text_depth = 1.4;
title_font_size = 3.8;

pot_label_distance = -10;

pots = [
    [3, 110, "Carrier", 90],
    [3, 90, "Mod Freq", 90],
    [3, 70, "Mod Amt", 90]];

leds = [
    [3, 55, 3]];

jacks = [
    [1.5, 25, "In", 0],
    [4.5, 25, "Out", 0],
    [1.5, 43, "Freq", 180],
    [4.5, 43, "Amt", 180]];

panel_flipped = false;
generatePanel();
