tolerance = 0.3;
$fn = $preview ? 20 : 100;

module switch(){
    cylinder(r = 3.5 + tolerance, h = 8);
    
    translate([0, 0, -7.5])
    cube([8 + tolerance * 2, 13 + tolerance * 2, 15], center = true);
}

switch();