include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "DIV";
text_depth = 1.6;
title_font_size = 3.2;
margin=3;
leds = [
    [3, 105, 3],
    [3, 85, 3],
    [3, 75, 3],
    [3, 65, 3],
    [3, 55, 3],
    [3, 45, 3],
    [3, 35, 3],
    [3, 25, 3],
    [3, 15, 3]];

jacks = [
    [1, 105, "IN", -90],
    [1, 85, "OUT", -90],
    [1, 75, "", -90],
    [1, 65, "", -90],
    [1, 55, "", -90],
    [1, 45, "", -90],
    [1, 35, "", -90],
    [1, 25, "", -90],
    [1, 15, "", -90]];
panel_flipped = false;

generatePanel();
