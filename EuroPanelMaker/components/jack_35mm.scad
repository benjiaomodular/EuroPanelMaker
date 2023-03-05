$fn=100; 
tolerance = 0.3;

module jack_35mm(x, y, r){
    
    
    translate([0, 0, 2.5]){
        cylinder(r=3 + tolerance, h=5, center=true);
        
    }
    
    translate([0, 0, -0.5]) {
    
        cylinder(r=4.2, h=1.2, center=true);
        
        translate([-1.5, 0, -13.5]){
            cube([3, 10, 13]);
        }
    }
    
    
    box_width = 9 + tolerance;
    translate([-box_width/2, -6 - tolerance / 2, -14]){
        cube([box_width, 10.6 + tolerance, 13]);
    }
    

}

jack_35mm(0, 0, 0);