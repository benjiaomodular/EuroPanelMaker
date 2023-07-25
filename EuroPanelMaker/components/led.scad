tolerance = 0.3;
$fn = $preview ? 20 : 100;

module led(d = 3) {
    cylinder(d = d + (2 * tolerance), h = 2.5);
    
    translate([0, 0, -4])
    cylinder(d = d + 1 + (2 * tolerance), h = 4);
}

led();