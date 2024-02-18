$fn = $preview ? 20 : 100; 
tolerance = 0.3;

module speaker(d=75) {
    cylinder(r = 75/2, h = 7.5);
    
    translate([0, 0, -22.5]) 
    union() {
        cylinder(r = (d/2 + 12), h = 22.5);
        
        translate([-5.5, 8, 0])
        cube([11, 2.3, 22.5]);
    } 
    
    hull(){
        translate([(d/2 + 4) * sin(45), (d/2 + 4) * cos(45), 0])
            cylinder(r = 2, h = 7.5);   
        translate([(d/2 + 10) * sin(45), (d/2 + 10) * cos(45), 0])
            cylinder(r = 2, h = 7.5);  
    }
    
    hull(){
        translate([-(d/2 + 4) * sin(45), -(d/2 + 4) * cos(45), 0])
            cylinder(r = 2, h = 7.5);   
        translate([-(d/2 + 10) * sin(45), -(d/2 + 10) * cos(45), 0])
            cylinder(r = 2, h = 7.5);  
    }
    
    hull(){
        translate([-(d/2 + 4) * sin(45), (d/2 + 4) * cos(45), 0])
            cylinder(r = 2, h = 7.5);   
        translate([-(d/2 + 10) * sin(45), (d/2 + 10) * cos(45), 0])
            cylinder(r = 2, h = 7.5);  
    }
    
    hull(){
        translate([(d/2 + 4) * sin(45), -(d/2 + 4) * cos(45), 0])
            cylinder(r = 2, h = 7.5);   
        translate([(d/2 + 10) * sin(45), -(d/2 + 10) * cos(45), 0])
            cylinder(r = 2, h = 7.5);  
    }
}

speaker();