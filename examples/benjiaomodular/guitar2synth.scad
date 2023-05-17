include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "GuitarIn";
text_depth = 1.6;
title_font_size = 3.8;
margin = 3;

pots = [];

leds = [
    [2, 105, 12],
    [2, 63, 3],
    [2, 20, 12]];

jacks = [
    [2, 85, "To Synth", -90],
    [2, 40, "From Synth", -90]];

panel_flipped = false;
generatePanel();
