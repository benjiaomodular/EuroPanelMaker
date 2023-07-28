tolerance = 0.3;
$fn = $preview ? 20 : 100;

module key(){
    translate([0, 0, 4])
    hull(){
        cube([20 + tolerance * 2, 20 + tolerance * 2, 2], center = true);
        translate([0, 0, 10])
        cube([15 + tolerance * 2, 15 + tolerance * 2, 2], center = true);
    }
    
    translate([0, 0, 2])
    cube([14 + tolerance * 2, 14 + tolerance * 2, 4], center = true);
    
    translate([0, 0, -1])
    cube([14 + tolerance * 2, 14 + tolerance * 2, 2], center = true);
    
    
    translate([0, 0, -3.5])
    cube([16 + tolerance * 2, 16 + tolerance * 2, 5], center = true);
}

key();