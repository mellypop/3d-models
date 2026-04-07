include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <globals.scad>

segmentCount = ceil((inclineLength + inclinePathLength) / (buildPlateMax - buildPlateMargin * 2));

for(i = [0:segmentCount - 1]) {
    startLength = i * (buildPlateMax - (buildPlateMargin * 2));
    endLength = startLength + ((buildPlateMax - (buildPlateMargin * 2)) * (i+1));

    if(startLength < inclineLength) { // Build incline
        translate([
            (pathDepth + 50) * i,
            0,
            0
        ])

        difference() {
            translate([pathDepth, inclineLength, 0])
            rotate([0, 0, 180])
            wedge([
                pathDepth,
                inclineLength,
                height
            ]);
            
            for(j = [1:dowelCount]) {
                translate([
                    (dowelGap * j) - epsilon,
                    startLength + dowelLength - epsilon,
                    dowelGap * 2
                ])
                rotate([90, 0, 0])
                cylinder(
                    h = dowelLength + (epsilon * 2),
                    r1 = dowelRadius + epsilon,
                    r2 = dowelRadius + epsilon
                );
            }

            translate([-epsilon, 0, -epsilon])
            cube([
                pathDepth + (2 * epsilon),
                startLength - epsilon,
                height + (epsilon * 2)
            ]);

            translate([
                -epsilon,
                startLength + ((buildPlateMax - (buildPlateMargin * 2)) * (i+1)),
                -epsilon
            ])
            cube([
                pathDepth + 2 * epsilon,
                inclineLength,
                height + (epsilon * 2)
            ]);

            for(j = [1:dowelCount]) {
                translate([
                    (dowelGap * j) + epsilon,
                    endLength + epsilon,
                    dowelGap * 2
                ])
                rotate([90, 0, 0])
                cylinder(
                    h = dowelLength + (epsilon * 2),
                    r1 = dowelRadius + epsilon,
                    r2 = dowelRadius + epsilon
                );
            }
        }
    }

    if(endLength > inclineLength) { // Incline path
        
    }
}

translate([0,0,height + 50])
difference() {
    union() {
        translate([inclineLength, 0, 0])
        rotate([0, 0, 90])
        wedge(
            [
                pathDepth,
                inclineLength,
                height
            ]
        );
        translate([inclineLength, 0, gapHeight]) {
                cube(
                    [
                        inclinePathLength,
                        pathDepth,
                        pathHeight
                    ]
                );
        }
        translate([inclineLength,0,gapHeight])
        rotate([180, 0, 90])
        wedge(
            [
                pathDepth,
                inclinePathLength,
                gapHeight / 2
            ]
        );
        
        for(i = [1 : supportColumnCount]) {
            translate(
                [
                    inclineLength + inclinePathLength - (supportColumnGap / 2),
                    supportColumnGap * i,
                    0
                ]
            )
            cylinder(h = supportColumnHeight, r1 = supportColumnRadius, r2 = supportColumnRadius);
        }
    }

    for(i = [ 1 : dovetailCount]) {
        translate([
            inclineLength + inclinePathLength - (dovetailSlide / 2),
            dovetailGap * i,
            height+  epsilon
        ])
        rotate([180, 0, -90])
        dovetail(
            "male",
            dovetailWidth,
            dovetailHeight,
            dovetailSlide
        );
    }
}
