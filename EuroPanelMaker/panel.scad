use <components/jack_35mm.scad>
use <components/led_3mm.scad>
use <components/pot_alpha_16mm.scad>
use <components/mounting_tab.scad>
use <components/toggle.scad>

eurorack_h = 128.5;
eurorack_w = 5.08;

panel_thickness = 2; // thickness
component_depth = 1;
text_depth = 1.4;

rib_margin = 8;
rib_thickness = 2.6;
    
hp = 4;
w = hp * eurorack_w;
c = w / 2;

title = "Test";
title_font_size = 4.5;

pots = [];
leds = [];
jacks = [];
toggle_switches = [];

pot_label_distance = 10;
pot_label_font_size = 3;
jack_label_distance = 6;
jack_label_font_size = 3;
toggle_label_distance = 6;

// Flip panel for 3D printing
panel_flipped = false;
panel_translate_x = (panel_flipped)? w:0;
panel_translate_z = (panel_flipped)? panel_thickness:0;
panel_rotate = (panel_flipped)? 180:0;

module generatePanel(){
    $fn=100;

    echo("[Panel Maker]:", hp=hp);
    echo("[Panel Maker]:", w=w);
    echo("[Panel Maker]:", title=title);
   

    translate([panel_translate_x, 0, panel_translate_z]) rotate([0, panel_rotate, 0])
    difference(){
        union(){
            cube([w, eurorack_h, panel_thickness]);
            translate([0, rib_margin, -rib_thickness])
                cube([w, eurorack_h-rib_margin*2, rib_thickness]);
        }
        
        union(){
            generate_title();
            generate_mounting_holes();
            
            for (idx = [0 : len(pots)] ) {
                echo("POT:", idx=pots[idx]);
                if (pots[idx]) generate_pots(pots[idx]);
            }
            
            for (idx = [0 : len(leds)] ) {
                if (leds[idx]) generate_leds(leds[idx]);
            }
            
            for (idx = [0 : len(jacks)] ) {
                if (jacks[idx]) generate_jacks(jacks[idx]);
            }
            
            for (idx = [0 : len(toggle_switches)] ) {
                if (toggle_switches[idx]) generate_toggle_switch(toggle_switches[idx]);
            }
        }
    }

}

module generate_title(){
    translate([c, 118, panel_thickness-text_depth]) {
        linear_extrude(height=text_depth+1) {
            text(title,
                 font="Liberation Sans:style=bold",
                 size=title_font_size,
                 halign="center");
        }
    }    
}

module generate_mounting_holes(){
    if (hp == 1){
        translate([c, 3, 0]) cylinder(r=1.6, h=10, center=true);
        translate([c, eurorack_h-3, 0]) cylinder(r=1.6, h=10, center=true);
    } else {
        translate([7.5, 3, 0]) cylinder(r=1.6, h=10, center=true);
        translate([7.5, eurorack_h-3, 0]) cylinder(r=1.6, h=10, center=true);   
    }
    
    if (hp >= 10){
        translate([w - 7.5, 3, 0]) cylinder(r=1.6, h=10, center=true);
        translate([w - 7.5, eurorack_h-3, 0]) cylinder(r=1.6, h=10, center=true);
    } 
}

module generate_pots(params=[2, 95, "Label"]){
    translate([eurorack_w * params[0], params[1], component_depth])
        if (params[3]) {
            rotate([0,0,params[3]]) #pot_alpha_16mm();
        } else {
            #pot_alpha_16mm(); 
        }
    translate([eurorack_w * params[0], params[1]+pot_label_distance, panel_thickness-text_depth ]) {
        linear_extrude(height=text_depth+1) {
            text(params[2],
                 font="Liberation Sans:style=bold",
                 size=pot_label_font_size,
                 halign="center");
        }
    }
}

module generate_jacks(params=[2, 95, "Label"]){
    translate([eurorack_w * params[0], params[1], component_depth])
        if (params[3]) {
            rotate([0,0,params[3]]) #jack_35mm();
        } else {
            #jack_35mm();
        }
        

    translate([eurorack_w * params[0], params[1]+jack_label_distance, panel_thickness-text_depth ]) {
        linear_extrude(height=text_depth+1) {
            text(params[2],
                 font="Liberation Sans:style=bold",
                 size=pot_label_font_size,
                 halign="center");
        }
    }
}

module generate_toggle_switch(params=[2, 95, "Label"]){
    translate([eurorack_w * params[0], params[1], component_depth])
        if (params[3]) {
            rotate([0,0,params[3]]) #toggle_switch();
        } else {
            #toggle_switch();
        }
        

    translate([eurorack_w * params[0], params[1]+toggle_label_distance, panel_thickness-text_depth ]) {
        linear_extrude(height=text_depth+1) {
            text(params[2],
                 font="Liberation Sans:style=bold",
                 size=pot_label_font_size,
                 halign="center");
        }
    }
}


module generate_leds(params=[2, 60]){
    translate([eurorack_w * params[0], params[1], component_depth]) {
        #led_3mm(d=params[2]);
    }
}
    
generatePanel();