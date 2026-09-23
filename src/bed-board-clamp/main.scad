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
tolerance = 0.6;

clampDepth = barWidth + (screwHeadDiameter * 2) + (plasticThickness * 2);
clampHeight = (barHeight * 2) + gapHeight + (plasticThickness * 2) + (tolerance * 6);
clampInnerHeight = barHeight + (2 * tolerance);
clampGap = gapHeight - (2 * plasticThickness) + (2 * tolerance);
intersection() {
    union() {
        translate([
            clampWidth / 2,
            clampDepth - (clampWidth / 2),
            0
        ])
        cylinder(clampHeight, clampWidth / 2, clampWidth / 2, $fn = 256);
        
        translate([
            0,
            -boardThickness - tolerance - plasticThickness - epsilon,
        0
        ])
        cube([
            clampWidth,
            clampDepth - (clampWidth / 2) + boardThickness + tolerance + plasticThickness,
            clampHeight
        ]);
    }

    union() {
        difference() {
            cube([
                clampWidth,
                clampDepth,
                clampHeight
            ]);

            translate([
                -epsilon,
                plasticThickness + tolerance - epsilon,
                barHeight + (plasticThickness * 2) + (tolerance * 2)
            ])
            cube([
                clampWidth + (2 * epsilon),
                clampDepth + (2 * epsilon),
                clampGap
            ]);
            
            translate([
                -epsilon,
                plasticThickness + tolerance - epsilon,
                plasticThickness - tolerance
            ])
            cube([
                clampWidth + (2 * epsilon),
                clampDepth + (2 * epsilon),
                clampInnerHeight
            ]);
            
            translate([
                -epsilon,
                plasticThickness + tolerance - epsilon,
                (plasticThickness * 3) + (tolerance * 4) + gapHeight - (plasticThickness * 2) + barHeight
            ])
            cube([
                clampWidth + (2 * epsilon),
                clampDepth + (2 * epsilon),
                clampInnerHeight
            ]);

            translate([
                clampWidth / 2,
                clampDepth - (clampWidth / 2),
                plasticThickness / 2
            ])
            screw_hole(str(
                "M",screwSize,"x",threadPitch),
               thread=true,
               l=screwLength
           );

            translate([
                clampWidth / 2,
                clampDepth - (clampWidth / 2),
                (plasticThickness * 2.5) + gapHeight + (tolerance * 4)
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
                    gapHeight / 3
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
}
