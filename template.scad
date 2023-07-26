include <EuroPanelMaker/panel.scad>

hp = 4;
title = "VCA";
margin = 0; // Add extra width on each side for support

/*
Other parameters you may want to change:

text_depth = 1.4;
title_font_size = 4.5;
title_font = "Liberation Sans:style=bold";
label_font = "Liberation Sans:style=bold";
label_font_size = 3;
pot_label_distance = 12;
pot_label_font_size = 3;
jack_label_distance = 8;
jack_label_font_size = 3;
toggle_label_distance = 12;
toggle_label_font_size = 3;
*/

pots = [ // x (in HP column), y (mm), label, rotation (degrees)
    [2, 95, "CV AMT"]
];

leds = [ // x (in HP column), y (mm), diameter (mm)
    [3, 35, 3]
];

jacks = [ // x (in HP column), y (mm), label, size, rotation (degrees)
    [1, 18, "In"] ,
    [3, 18, "Out"],
    [1, 35, "CV"]
];

switches = [ // x (in HP column), y (mm), label above, label below, rotation (degrees)

];

labels = [ // x (in HP column), y (mm), label, rotation (degrees)

];

panel_flipped = !$preview; // flips on render for exporting
generatePanel();