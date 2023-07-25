tolerance = 0.3;
$fn = $preview ? 20 : 100;

module rectangular_hole(int_w = 25, int_l = 20, ext_w = 30, ext_l = 30){
    translate([0, 0, 4])
    cube([int_w, int_l, 8], center=true);
    
    translate([0, 0, -7.5])
    cube([ext_w, ext_l, 15], center=true);
}

rectangular_hole();