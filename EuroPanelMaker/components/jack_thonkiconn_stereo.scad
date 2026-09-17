$fn = $preview ? 20 : 100;

module jack_thonkiconn_stereo() {
        translate([0,0,0]) cylinder($fn=32,h=4,d=6+0.2);
        translate([0,-0.75,-1-4.5]) cube([10+0.2,10.5+0.2,9],center=true);

        // translate to actual center of this section
        translate([0,4.5 - 1 - 7.8/2,-1]) cube([8.2+0.2,7.8+0.2,2],center=true);

        translate([0,4.5,-1-4.5]) cube([1.5,4,9],center=true);
}

jack_thonkicon_stereo();
