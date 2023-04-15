include <../../EuroPanelMaker/panel.scad>

hp = 2;

title = "benjiaomodular";
text_depth = 1.2;
title_font_size = 6;
title_font = "DM Sans:style=bold";

title_y = 60;
title_x = 8;
title_rotate = 90;

margin=3;

pots=false;
leds = [
    [1, 95, 3],
    [1, 20, 12]];

toggle_switches = [
    [1, 105, "", 0]
];

jacks = [];

panel_flipped = false;

generatePanel();
