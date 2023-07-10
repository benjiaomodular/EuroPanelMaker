include <EuroPanelMaker/EuroPanelMaker/panel.scad>

hp = 8;
title = "EUROPI";
text_depth = 1.6;
title_font_size = 3.2;
margin=2;

pots= [
    [2, 79, ""],
    [6, 79, ""],
    ];
    
leds = [
    //buttons
    [2, 58, 11],
    [6, 58, 11],
    
    //output indicators
    [1, 27, 3],
    [4, 27, 3],
    [7, 27, 3],
    [1, 48, 3],
    [4, 48, 3],
    [7, 48, 3],
];

jacks = [
    [1, 36, "1"],
    [4, 36, "2"],
    [7, 36, "3"],
    [1, 15, "4"],
    [4, 15, "5"],
    [7, 15, "6"],
    [2, 113, "", 180],
    [6, 113, "", 180],];

labels = [
    [1, 108, "A"],
    [7, 108, "D"]];

toggle_switches = [
];

rectangular_holes = [
    [4, 97, 25, 12, 40, 15]
];

panel_flipped = false;

generatePanel();
