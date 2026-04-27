include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <globals.scad>

segmentCount = ceil((inclineLength + inclinePathLength) / (buildPlateMax - buildPlateMargin * 2));

for(i = [0:segmentCount - 1]) {
    startLength = i * (buildPlateMax - (buildPlateMargin * 2));
    endLength = startLength + ((buildPlateMax - (buildPlateMargin * 2)));
    segmentLength = endLength - startLength;

    union() {
        if(startLength < inclineLength) { // Build incline
            leftoverOffset = 0;
            if(startLength > 0) {
                leftoverOffset = inclineLength - startLength;
            }
            translate([
                (pathDepth + 50) * i,
                -startLength,
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
                    segmentLength,
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
            leftoverOffset = 0;
            translate([((pathDepth + 50) * i),startLength, 0])
            cube([pathDepth, 50, 150]);
            translate([((pathDepth + 50) * i),endLength, 0])
            cube([pathDepth, 50, 150]);

            if(startLength < inclineLength) {
                leftoverOffset = (inclineLength - startLength) + 100000;
            }
            translate([
                ((pathDepth + 50) * i),
                leftoverOffset,
                0
            ])
            difference() {
                translate([pathDepth, 0, 0])
                rotate([0, 0, 90])
                difference() {
                    union() {
                        translate([0, 0, gapHeight]) {
                                difference() {
                                    cube(
                                        [
                                            inclinePathLength,
                                            pathDepth,
                                            pathHeight
                                        ]
                                    );
                                    translate([inclinePathLength - dovetailSlide, 0, dovetailHeight + epsilon])
                                    cube([
                                        dovetailSlide,
                                        pathDepth,
                                        dovetailHeight
                                    ]);
                                }
                        }
                        translate([0,0,gapHeight])
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
                                    inclinePathLength - (supportColumnGap / 2),
                                    supportColumnGap * i,
                                    0
                                ]
                            )
                            cylinder(h = supportColumnHeight, r1 = supportColumnRadius, r2 = supportColumnRadius);
                        }
                        for(i = [ 1 : dovetailCount]) {
                            translate([
                                inclinePathLength - (dovetailSlide / 2),
                                dovetailGap * i,
                                height - dovetailHeight +  epsilon
                            ])
                            rotate([0, 0, -90])
                            dovetail(
                                "male",
                                dovetailWidth,
                                dovetailHeight,
                                dovetailSlide
                            );
                        }
                    }

                    for(j = [1:dowelCount]) {
                        translate([
                            (dowelGap * j) + epsilon,
                            endLength + epsilon,
                            dowelGap * 2
                        ])
                        rotate([90, 0, 0])
                        #cylinder(
                            h = dowelLength + (epsilon * 2),
                            r1 = dowelRadius + epsilon,
                            r2 = dowelRadius + epsilon
                        );
                    }
                }
                translate([
                    -epsilon,
                    segmentLength + epsilon,
                    0
                ])
                cube([
                    pathDepth + (2 * epsilon),
                    (segmentLength + epsilon) / 2,
                    height + epsilon
                ]);
            }
        }
    }
}


