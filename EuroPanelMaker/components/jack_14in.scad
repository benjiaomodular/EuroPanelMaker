$fn = $preview ? 20 : 100; 
tolerance = 0.3;

module jack_14in() {
    cylinder(r = 4.4 + tolerance, h = 7.5);
    
    translate([0, 0, -22.5]) 
    union() {
        cylinder(r = 9.5, h = 22.5);
        
        translate([-5.5, 8, 0])
        cube([11, 2.3, 22.5]);
    } 
}

jack_14in();