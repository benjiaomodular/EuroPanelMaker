include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "FOLDER";
text_depth = 1.4;
title_font_size = 3.2;

pot_label_distance = -12;

pots = [
    [2, 111, "Input LVL"],
    [2, 82, "CV Range"],
    [2, 57, "CV Amt"]];

leds = [
    [3, 94, 3],
    [3, 32, 5]];

jacks = [
    [1, 32, "CV"],
    [1, 14, "In"],
    [3, 14, "Out"]];

toggle_switches = [];

panel_flipped = false;
generatePanel();
