// Hex Spacers

tolerance = 0.3;
$fn = $preview ? 20 : 100;

module spacer(m=3) {
    dims = [
        [2, 3.3],
        [2.5, 5.3],
        [3, 5.3],
        [4, 6.7],
        [5, 8],
        [6, 9]
    ];

    n = dims[search(m, dims)[0]][1];
    
    echo("N: ", n);
    cylinder(r = m/2 + tolerance, h = 8);
    
    translate([0, 0, -10])
    union() {        
        cylinder(r = n/2 + tolerance, h = 10, $fn=6);
    }
}

spacer();
