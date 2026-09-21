include <BOSL2/std.scad>
include <BOSL2/screws.scad>

barWidth = 20.8;
barHeight = 20.8;
shelfThickness = 15;
screwHeadDiameter = 25;
screwSize = 20;
screwLength = 20;
threadPitch = 2;
boardThickness = 5.1;
gapHeight =155;
epsilon = 0.0001;
plasticThickness = 10;
clampWidth = 50;
tolerance = 0.8;

union() {
    difference() {
        cube([
            clampWidth,
            barWidth + (screwHeadDiameter * 2) + (plasticThickness * 2),
            (barHeight * 2) + gapHeight + (plasticThickness * 4) + (tolerance * 6)
        ]);

        translate([
            -epsilon,
            plasticThickness + tolerance - epsilon,
            barHeight + (plasticThickness * 2) + (tolerance * 3)
        ])
        cube([
            clampWidth + (2 * epsilon),
            barWidth + (screwHeadDiameter * 2) + (2 * epsilon) + (plasticThickness * 2),
            gapHeight
        ]);
        
        translate([
            -epsilon,
            plasticThickness + tolerance - epsilon,
            plasticThickness + tolerance
        ])
        cube([
            clampWidth + (2 * epsilon),
            barWidth + (screwHeadDiameter * 2) + (2 * epsilon) + (plasticThickness * 2),
            barHeight + (tolerance * 2)
        ]);
        
        translate([
            -epsilon,
            plasticThickness + tolerance - epsilon,
            (plasticThickness * 3) + (tolerance * 4) + gapHeight + barHeight
        ])
        cube([
            clampWidth + (2 * epsilon),
            barWidth + (screwHeadDiameter * 2) + (2 * epsilon) + (plasticThickness * 2),
            barHeight + (tolerance * 2)
        ]);

        translate([
            clampWidth / 2,
            barWidth + screwHeadDiameter + plasticThickness,
            plasticThickness / 2
        ])
        screw_hole(str(
            "M",screwSize,"x",threadPitch),
           thread=true,
           l=screwLength
       );

        translate([
            clampWidth / 2,
            barWidth + screwHeadDiameter + plasticThickness,
            (plasticThickness * 4.5) + gapHeight + (tolerance * 4)
        ])
        screw_hole(str(
            "M",screwSize,"x",threadPitch),
           thread=true,
           l=screwLength
       );
    }
    
    translate([
        -clampWidth / 4,
        -boardThickness - plasticThickness - tolerance, 
        0
    ]) {
        difference() {
            cube([
                clampWidth * 1.5,
                boardThickness + plasticThickness + tolerance,
                gapHeight / 4
            ]);
            translate([
                -epsilon,
                plasticThickness,
                plasticThickness
            ])
            cube([
                clampWidth * 2,
                boardThickness + tolerance,
                gapHeight
            ]);
        }
    }
}