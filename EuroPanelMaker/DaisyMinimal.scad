use <components/jack_35mm.scad>
use <components/led_3mm.scad>
use <components/pot_alpha_16mm.scad>
use <components/mounting_tab.scad>



$fn=100; 
hp = 8;

EURORACK_H = 128.5;
EURORACK_W = 5.08;
THICKNESS = 2; // thickness

w = hp * EURORACK_W;

module main(){
    cube([w, EURORACK_H, THICKNESS]);
    translate([11, 1.4, -0.8]) cube([w-11, 3.2, 0.8]);
    translate([11, EURORACK_H-4.6, -0.8]) cube([w-11, 3.2, 0.8]);
    
    // rib
    rib_height = 10;
    rib_margin = 13;
    rib_thickness = 5;
    translate([0, rib_margin,-rib_height])
        cube([rib_thickness, EURORACK_H-rib_margin*2, rib_height]);
    // --- 

    translate([0, rib_margin, -2.4])
        cube([w, EURORACK_H-rib_margin*2, 2.4]);
    
    rotate([180, 0, 0])
        translate([0, -64, 0])
        mounting_tab();
}

module eurorack_mult(){
    
    center = w / 2;
    
    difference() {
        
        union(){
            main();
        }
        
        union(){
            // mounting holes
            translate([7.5, 3, 0]) cylinder(r=1.6, h=10, center=true);
            translate([7.5, EURORACK_H-3, 0]) cylinder(r=1.6, h=10, center=true);
            
            
            // ---
            
            translate([6, 118, 1]) {
                linear_extrude(height=1.4) {
                    text("DaisyVerb",
                         font="Liberation Sans",
                         size=4.5);
                }
            }
            
            
            translate([EURORACK_W * 2, 105, 0])  pot_alpha_16mm(); 
            
            translate([EURORACK_W * 2 - 4, 105-14.5, 1]) {
                linear_extrude(height=1.4) {
                    text("DRY",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            translate([EURORACK_W * 2, 78, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 2 -4, 78-14.5, 1]) {
                linear_extrude(height=1.4) {
                    text("FBK",
                         font="Liberation Sans",
                         size=3);
                }
            }
           
            translate([EURORACK_W * 6, 51, 0])   pot_alpha_16mm(); 
             translate([EURORACK_W * 6 -5, 51-14.5, 1]) {
                linear_extrude(height=1.4) {
                    text("LPF",
                         font="Liberation Sans",
                         size=3);
                }
            }      
            
            translate([EURORACK_W * 2, 52]) led_3mm();
        
            translate([EURORACK_W * 6, 105, 0])  pot_alpha_16mm(); 
            translate([EURORACK_W * 6 -5, 105-14.5, 1]) {
                linear_extrude(height=1.4) {
                    text("MOD1",
                         font="Liberation Sans",
                         size=3);
                }
            }

            translate([EURORACK_W * 6, 78, 0])   pot_alpha_16mm(); 
            translate([EURORACK_W * 6 -5, 78-14.5, 1]) {
                linear_extrude(height=1.4) {
                    text("MOD2",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            
            translate([EURORACK_W * 1, 20, 0]) jack_35mm();
            translate([EURORACK_W * 3 - 1.1, 20, 0]) jack_35mm();
            
            translate([EURORACK_W * 1 + 2, 25, 1]) {
                linear_extrude(height=1.4) {
                    text("IN",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            
            translate([EURORACK_W * 5 + 1.1, 20, 0]) jack_35mm();
            translate([EURORACK_W * 7, 20, 0]) jack_35mm();
            
            translate([EURORACK_W * 5 + 2, 25, 1]) {
                linear_extrude(height=1.4) {
                    text("OUT",
                         font="Liberation Sans",
                         size=3);
                }
            }
            
            
            //logo(18, 16, 1.4);
        }
    }
}

translate([w, 0, 2]) rotate([0, 180, 0])  eurorack_mult();