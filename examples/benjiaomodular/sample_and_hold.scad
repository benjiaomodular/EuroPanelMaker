include <../../EuroPanelMaker/panel.scad>

hp = 8;
title = "SNH";
text_depth = 1.4;
title_font_size = 4;
margin = 3;

pots = [
    [2, 65, "PROB_AMT"],
    [6, 65, "BIAS"]];

leds = [
    [6, 28, 3],
    [2, 28, 3]];

labels = [];

jacks = [
    [6, 105, "TRIG IN"],
    [2, 105, "NOISE_IN"],
    [2, 86, "PROB_IN"],
    [6, 15, "GATE"],
    [2, 15, "~GATE"],
    [6, 40, "SNH_OUT", "35mm", 180]];

panel_flipped = false;
generatePanel();
