include <../../EuroPanelMaker/panel.scad>

hp = 8;
title = "EUROPI";
text_depth = 1.6;
title_font_size = 3.2;
margin=2;

pots= [
    [2, 81, ""],
    [6, 81, ""],
    ];
    
leds = [

    
    //output indicators
    [1, 26, 3],
    [4, 26, 3],
    [7, 26, 3],
    [1, 47, 3],
    [4, 47, 3],
    [7, 47, 3],
];

jacks = [
    [1, 35, "1"],
    [4, 35, "2"],
    [7, 35, "3"],
    [1, 14, "4"],
    [4, 14, "5"],
    [7, 14, "6"],
    [2, 114, "", "35mm", 180],
    [6, 114, "", "35mm", 180],];

keys_mm = [
    //buttons
    [9, 60, 11],
    [31, 60, 11],
];

labels = [
    [1, 108, "A"],
    [7, 108, "D"]];

switches = [
];

rectangular_holes = [
    [4, 98, 25, 12, 40, 15]
];

panel_flipped = false;

generatePanel();
