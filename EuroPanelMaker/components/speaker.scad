$fn = $preview ? 20 : 100; 
tolerance = 0.3;

module speaker(d=75, mount=95, screw=85) {
    cylinder(r=d/2, h=7.5);
    
    translate([0, 0, -22.5])
    cylinder(r=mount/2, h=22.5);
    
    translate([screw/2 * sin(45), screw/2 * cos(45), 0])
        cylinder(r = 2, h = 7.5);
    
    translate([-screw/2 * sin(45), -screw/2 * cos(45), 0])
        cylinder(r = 2, h = 7.5);

    translate([-screw/2 * sin(45), screw/2 * cos(45), 0])
            cylinder(r = 2, h = 7.5);
    
    translate([screw/2 * sin(45), -screw/2 * cos(45), 0])
            cylinder(r = 2, h = 7.5);
}

speaker();