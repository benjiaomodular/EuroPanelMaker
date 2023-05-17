include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "Bong0";
text_depth = 1.6;
title_font_size = 3.8;
margin = 3;

pots = [
    [2, 95, "Env"],
    [2, 70, "Freq"]];

leds = [
    [2, 50, 3],
    [1, 18, 5],];

jacks = [
    [1, 35, "Trig",180],
    [3, 35, "CV", 180],
    [3, 18, "Out"],];

panel_flipped = false;
generatePanel();
