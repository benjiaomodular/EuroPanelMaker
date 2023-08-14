include <../../EuroPanelMaker/panel.scad>

hp = 8;
title = "CV MIX";
text_depth = 1.6;
title_font_size = 3.8;
margin = 3;

pots = [
    [6, 105, "", -90],
    [6, 85, "", -90],
    [6, 65, "", -90],
    [6, 45, "", -90],
    [6, 25, "", -90]];

leds = [[1, 49, 3]];

jacks = [
    [1, 105, "1", "35mm", -90],
    [1, 90, "2", "35mm",-90],
    [1, 75, "3", "35mm",-90],
    [1, 60, "4", "35mm",-90],
    [1, 35, "INV", "35mm",-90],
    [1, 20, "OUT", "35mm",-90]
];

panel_flipped = true;
generatePanel();
