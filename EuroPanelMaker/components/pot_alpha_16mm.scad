// Based on Alpha RV16 dimensions

tolerance = 0.3;
$fn = $preview ? 20 : 100;

module pot_alpha_16mm() {
    cylinder(r = 3.5 + tolerance, h = 8);
    
    translate([0, 0, -0.5])
    cylinder(r = 5.4 + tolerance, h = 0.5);
       
    translate([0, 0, -10.5])
    union() {
        translate([-8, -14, 0])
        cube([16, 14, 10]);
        
        cylinder(r = 9.5 + tolerance, h = 10);
    }
}

pot_alpha_16mm();