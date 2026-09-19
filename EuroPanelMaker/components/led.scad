tolerance = 0.3;
$fn = $preview ? 20 : 100;

module led(d = 3, flange_d = undef) {
    flange_d = flange_d ? flange_d : d + 0.7;
    // main led part, without flange
    cylinder(d = d + (2 * tolerance), h = d*1.5);

    // flange and hole
    translate([0, 0, -4])
    cylinder(d = flange_d + (2 * tolerance), h = 4);
}

led();
