tolerance = 0.3;
$fn = $preview ? 20 : 100;

module switch(width=undef, diameter=undef){
    width = width ? width : 8;
    r = diameter ? diameter/2 : 3.5;
    cylinder(r = r + tolerance, h = 8);
    
    translate([0, 0, -7.5])
    cube([width + tolerance * 2, 13 + tolerance * 2, 15], center = true);
}

switch();
