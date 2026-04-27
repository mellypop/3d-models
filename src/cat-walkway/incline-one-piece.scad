include <BOSL2/std.scad>
include <BOSL2/joiners.scad>
include <globals.scad>

union() {
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

translate([0,0,height + 50])
union() {
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
