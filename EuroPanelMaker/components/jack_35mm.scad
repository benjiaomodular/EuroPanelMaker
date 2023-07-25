tolerance = 0.3;
$fn = $preview ? 20 : 100;

module jack_35mm() {
    cylinder(r = 3 + tolerance, h = 5);
    
    translate([0, 0, -1.1])
    cylinder(r = 4.2, h = 1.2);
        
    translate([-1.5, 0, -14])
    cube([3, 10, 13]);

    box_width = 9 + tolerance;
    translate([-box_width / 2, -6 - tolerance / 2, -14])
    cube([box_width, 10.6 + tolerance, 13]);
}

jack_35mm();