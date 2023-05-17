include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "MiniMic";
text_depth = 1;
title_font_size = 3.2;
margin = 2;

pots = [
    [2, 100, "CH1 Gain"],
    [2, 75, "CH2 Gain"]];

leds = [];

jacks = [
    [1, 35, "IN1"],
    [3, 35, "IN2"],
    [1, 15, "O1"],
    [3, 15, "O2"]];

panel_flipped = false;
generatePanel();
