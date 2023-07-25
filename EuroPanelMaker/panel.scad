use <components/jack_35mm.scad>
use <components/led.scad>
use <components/pot_alpha_16mm.scad>
use <components/mounting_tab.scad>
use <components/switch.scad>

eurorack_h = 128.5;
eurorack_w = 5.08;

panel_thickness = 2; // thickness
component_depth = 1;
text_depth = 1.4;

rib_margin = 8;
rib_thickness = 3;
    
hp = 6;
w = hp * eurorack_w;
c = w / 2;

title = "Test";
title_font_size = 4.5;
title_font = "Liberation Sans:style=bold";
title_x = w / 2;
title_y = 118;
title_rotate = 0;

pots = [];
leds = [];
jacks = [];
switches = [];
labels = [];
rectangular_holes = []; // [3, 100, x1, y1, x2, y2]

label_font = "Liberation Sans:style=bold";
label_font_size = 3;
pot_label_distance = 12;
pot_label_font_size = 3;
jack_label_distance = 8;
jack_label_font_size = 3;
switch_label_distance = 12;
switch_label_font_size = 3;

// Flip panel for 3D printing
panel_flipped = false;
panel_translate_x = panel_flipped ? w : 0;
panel_translate_z = panel_flipped ? panel_thickness : 0;
panel_rotate = panel_flipped ? 180 : 0;

margin = 0;

module generatePanel() {
    $fn = $preview ? 20 : 100;

    echo("Panel Maker:", hp = hp, w = w, title = title);   

    translate([panel_translate_x, 0, panel_translate_z])
    rotate([0, panel_rotate, 0])
    difference(){
        union(){
            translate([-margin, 0, 0])
            union() {
                cube([w + margin * 2, eurorack_h, panel_thickness]);
                
                translate([0, rib_margin, -rib_thickness])
                cube([w + margin * 2, eurorack_h - rib_margin * 2, rib_thickness]);
            }
        }
        
        union(){
            generate_title();
            generate_mounting_holes();
            
            for (idx = [0 : len(pots)]) {
                if (pots[idx]) {
                    echo("POT:", idx = pots[idx]);
                    generate_pots(pots[idx]);
                }
            }
            
            for (idx = [0 : len(leds)]) {
                if (leds[idx]) {
                    echo("LED:", idx = leds[idx]);
                    generate_leds(leds[idx]);
                }
            }
            
            for (idx = [0 : len(jacks)]) {
                if (jacks[idx]) {
                    echo("JACK:", idx = jacks[idx]);
                    generate_jacks(jacks[idx]);
                }
            }
            
            for (idx = [0 : len(switches)]) {
                if (switches[idx]) {
                    echo("SWITCH:", idx = switches[idx]);
                    generate_switches(switches[idx]);
                }
            }
            
            for (idx = [0 : len(labels)]) {
                if (labels[idx]) {
                    echo("LABEL:", idx = labels[idx]);
                    generate_extra_labels(labels[idx]);
                }
            }
            
            for (idx = [0 : len(rectangular_holes)]) {
                if (rectangular_holes[idx]) {
                    echo("HOLE:", idx = rectangular_holes[idx]);
                    generate_rectangular_holes(rectangular_holes[idx]);
                }
            }
        }
    }

}

module generate_rectangular_holes(params = [3, 100, 25, 20, 30, 30]) {
    translate([eurorack_w * params[0], params[1], 0 ])
    union() {
        #cube([params[2], params[3], panel_thickness*2], center=true);
        
        translate([0, 0, -panel_thickness])
        #cube([params[4], params[5], panel_thickness], center=true);   
    }
}
    
module generate_title() {
    translate([title_x, title_y, panel_thickness - text_depth])
    rotate([0, 0, title_rotate])
    linear_extrude(height = text_depth + 1)
    text(title, font = title_font, size = title_font_size, halign = "center"); 
}

module generate_mounting_holes(params=[2, 95, "Label"]) {
    if (hp == 1){
        translate([c, 3, 0])
        cylinder(r = 1.6, h = 10, center = true);
        
        translate([c, eurorack_h - 3, 0])
        cylinder(r = 1.6, h = 10, center = true);
    } else if (hp == 2){
        hull(){
            translate([c - 1, 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
            
            translate([c + 1, 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
        }
        
        hull(){
            translate([c - 1, eurorack_h - 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
            
            translate([c + 1, eurorack_h - 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
        }
    } else {
        hull(){
            translate([6, 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
            
            translate([9, 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
        }
        
        hull(){
            translate([6, eurorack_h - 3, 0])
            cylinder(r = 1.6, h = 10, center = true); 
            
            translate([9, eurorack_h - 3, 0])
            cylinder(r = 1.6, h = 10, center = true);  
        }
    }
    
    if (hp >= 5){
        hull(){
            translate([w - 6, 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
            
            translate([w - 9, 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
        }
        hull(){
            translate([w - 6, eurorack_h - 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
            
            translate([w - 9, eurorack_h - 3, 0])
            cylinder(r = 1.6, h = 10, center = true);
        }
    } 
}

module generate_extra_labels(params=[2, 95, "Label"]) {
    translate([eurorack_w * params[0], params[1], panel_thickness - text_depth ])
    rotate([0, 0, params[3] ? params[3] : 0])
    linear_extrude(height = text_depth + 1)
    text(params[2], font = label_font, size = label_font_size, halign = "center");
}

module generate_pots(params=[2, 95, "Label"]) {
    translate([eurorack_w * params[0], params[1], component_depth])
    rotate([0, 0, params[3] ? params[3] : 0])
    #pot_alpha_16mm();

    translate([eurorack_w * params[0], params[1] + pot_label_distance, panel_thickness - text_depth])
    linear_extrude(height = text_depth + 1)
    text(params[2], font = label_font, size = pot_label_font_size, halign = "center", valign = "center");
}

module generate_jacks(params=[2, 95, "Label"]){
    translate([eurorack_w * params[0], params[1], component_depth])
    rotate([0, 0, params[3] ? params[3] : 0])
    #jack_35mm();

    translate([eurorack_w * params[0], params[1] + jack_label_distance, panel_thickness - text_depth])
    linear_extrude(height = text_depth + 1)
    text(params[2], font = label_font, size = jack_label_font_size, halign = "center", valign = "center");
}

module generate_switches(params=[2, 95, "Label", ""]){
    translate([eurorack_w * params[0], params[1], component_depth])
    rotate([0, 0, params[4] ? params[4] : 0])
    #switch();

    translate([eurorack_w * params[0], params[1] + switch_label_distance, panel_thickness - text_depth])
    linear_extrude(height = text_depth + 1)
    text(params[2], font = label_font, size = switch_label_font_size, halign = "center", valign = "center");
    
    translate([eurorack_w * params[0], params[1] - switch_label_distance, panel_thickness - text_depth])
    linear_extrude(height = text_depth + 1)
    text(params[2], font = label_font, size = switch_label_font_size, halign = "center", valign = "center");
}


module generate_leds(params=[2, 60, 3]){
    translate([eurorack_w * params[0], params[1], component_depth])
    #led(d = params[2]);
}

// uncomment the following line for testing, otherwise it causes panels to generate twice
//generatePanel();