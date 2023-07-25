$fn = $preview ? 20 : 100;

module mounting_tab() {
    thickness = 6;
    height = 27;
    width = 17;
    
    difference() {
        union() {
            cube([thickness, width, height]);
            
            translate([thickness, 0, 0])
            difference() {
                cube([6, width, 6]);
                
                rotate([90, 0, 0])
                translate([6, 6, -8.5])
                cylinder(r = 6, h = 17, center = true);
            }
        }
        
        union() {
            rotate([0, 90, 0])
            union() {
                hull() {
                    translate([-22.5, 8.5, 0])
                    cylinder(r = 1.5, h = thickness);
                    
                    translate([-18, 8.5, 0])
                    cylinder(r = 1.5, h = thickness);
                }
                
                hull() {
                    translate([-22.5, 8.5, -1.5])
                    cylinder(r = 3, h = 3);
                    
                    
                    translate([-18, 8.5, -1.5])
                    cylinder(r = 3, h = 3);
                }
            }
            
            translate([thickness - 1.5, 0, height - 11])
            cube([1.5, width, 11]);
        }
    }
}

mounting_tab();