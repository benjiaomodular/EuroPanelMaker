include <../../EuroPanelMaker/panel.scad>

hp = 3;
title = "";
text_depth = 1.6;
title_font_size = 3.2;

pots=false;
leds = [];

jacks = [
    [1.5, 35, "SAW >"],
    [1.5, 18, "> TRI"],
    [1.5, 102, "SAW >"],
    [1.5, 85, "> TRI"]];

panel_flipped = false;

generatePanel();
