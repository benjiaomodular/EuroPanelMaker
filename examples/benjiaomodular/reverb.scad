include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "REVERB";
text_depth = 1.4;
title_font_size = 3.2;
pot_label_distance = -12;
margin = 3;

pots = [
    [2, 110, "FBK"],
    [2, 84, "AMT"],
    [2, 58, "LPF"]];

leds = [
    [3, 32, 5]];

jacks = [
    [1, 32, "CV"],
    [1, 14, "In"],
    [3, 14, "Out"]];

toggle_switches = [];

panel_flipped = true;
generatePanel();
