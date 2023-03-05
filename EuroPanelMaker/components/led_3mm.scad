$fn=100; 

tolerance = 0.3;
module led_3mm(d=3){
    cylinder(r=d/2 + tolerance, h=5, center = true);
    translate([0, 0, -2]) cylinder(r=(d+1)/2 + tolerance, h=4, center = true);
}

led_3mm();