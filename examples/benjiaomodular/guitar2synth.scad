include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "GuitarIn";
text_depth = 1.6;
title_font_size = 3.8;
margin = 3;

pots = [];

leds = [
    [2, 63, 3]];

jacks = [
    [2, 105, "", "14in", -90],
    [2, 20, "", "14in", -90],
    [2, 85, "To Synth", "35mm", -90],
    [2, 40, "From Synth", "35mm", -90]];

panel_flipped = false;
generatePanel();
