include <../../EuroPanelMaker/panel.scad>

hp = 4;
title = "VCA";
text_depth = 1.6;

pots = [
    [2, 95, "CV AMT"]];

leds = [
    [3, 35]];

jacks = [
    [1, 18, "In"],
    [3, 18, "Out"],
    [1, 35, "CV"]];

panel_flipped = true;
generatePanel();
