// Hex Spacers

tolerance = 0.3;
$fn = $preview ? 20 : 100;

module spacer(m=3) {
    widths = [
        [2, 3.3],
        [2.5, 5.3],
        [3, 5.3],
        [4, 6.7],
        [5, 8],
        [6, 9]
    ];

    w = widths[search(m, widths)[0]][1];
    
    echo("W: ", w);
    cylinder(r = m/2 + tolerance, h = 8);
    
    translate([0, 0, -10])
    union() {        
        cylinder(r = w/2 + tolerance, h = 10, $fn=6);
    }
}

spacer();
