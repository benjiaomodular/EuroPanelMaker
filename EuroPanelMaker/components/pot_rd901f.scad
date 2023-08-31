// Based on Alpha RD901F

tolerance = 0.3;
$fn = $preview ? 20 : 100;

module pot_rd901f() {
    translate([0, 0, -1])
    cylinder(r = 3.5 + tolerance, h = 8);

    translate([-1, -6.5, -1])
    cube([2, 3, 1]);
    
    translate([0, 0, -11])
        union() {
            translate([-5, -6.5, 0])
            cube([10, 12, 10]);
        }
}

pot_rd901f();