tolerance = 0.3;
$fn = $preview ? 20 : 100;

module switch_sr16() {
    cylinder(r = 4.5 + tolerance, h = 8);
    
    translate([-1, -8.5, 0])
    cube([2, 9, 1]);
       
    translate([0, 0, -10])
    cylinder(r = 8 + tolerance, h = 10);
}

switch_sr16();