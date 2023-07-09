$fn=100; 

tolerance = 0.3;
module rectangular_hole(int_w=25, int_l=20, ext_w=30, ext_l=30){
    shaft_height = 8;
    translate([0, 0, shaft_height/2]){
        cube([int_w, int_l, shaft_height], center=true);
    }
    
    body_height = 15;
    translate([0, 0, -body_height/2]){
        cube([ext_w, ext_l, body_height], center=true);
    }      
}

rectangular_hole();