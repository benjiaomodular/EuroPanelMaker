$fn=100; 

tolerance = 0.3;
module toggle_switch(){
    
    
    shaft_height = 8;
    translate([0, 0, shaft_height/2]){
        cylinder(r=3.5 + tolerance, h=shaft_height, center=true);
    }
    
    body_height = 15;
    translate([0, 0, -body_height/2]){
        cube([8+tolerance*2, 13+tolerance*2, body_height], center = true);
    }      
    

}

pot_alpha_16mm();