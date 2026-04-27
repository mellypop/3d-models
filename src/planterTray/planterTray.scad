include<../modules/heart.scad>
include<../modules/scallopCirclet.scad>

epsilon = 0.001;

innerDiameter = 140;
solidInnerWallHeight = 10;
wallWidth = 2;
floorHeight = 5;

diameter = innerDiameter + (wallWidth * 2);
height = solidInnerWallHeight + floorHeight;

radius = diameter / 2;
innerRadius = innerDiameter / 2;

intersection() {
    union() {
        difference() {
            difference() {
                union() {
                    difference() {
                        cylinder(height, radius, radius, $fn = 512);

                        translate([0,0,floorHeight])
                        cylinder(
                            solidInnerWallHeight * 4,
                            innerRadius,
                            innerRadius + 0.5,
                            $fn = 128
                        );

                        linear_extrude(height = floorHeight / 4)
                        translate([innerDiameter / 4 + 5, -3, -2])
                        rotate([0, 180, 0]) {
                            translate([-6,6,0])
                            heart(10,10);
                            text("mellypop :3");
                        }
                    }

                    translate([0,0,height-floorHeight])
                    scallopCirclet(
                        radius,
                        wallWidth
                    );
                }
            }
        }


        translate([0, 10, floorHeight + epsilon])
        difference() {
            union() {
                numSegments = floor(innerDiameter / 10) - 2;
                for(i = [1 : numSegments]) {
                    difference() {
                        linear_extrude(height = 2)
                        heart(
                            innerDiameter - (10 * i),
                            innerDiameter - (10 * i)
                        );

                        linear_extrude(height = 2)
                        heart(
                            innerDiameter - (10 * i) - 5,
                            innerDiameter - (10 * i) - 5
                        );
                    }
                }
            }
            translate([
                -innerDiameter / 2,
                -innerDiameter / 4,
                0
            ])
            cube([
                innerDiameter,
                2,
                2
            ]);
            translate([
                -innerDiameter / 2,
                0,
                0
            ])
            cube([
                innerDiameter,
                2,
                2
            ]);
            translate([
                -1,
                -(innerDiameter / 2) - 10,
                0
            ])
            cube([
                2,
                innerDiameter,
                2
            ]);
        }
    }

    cylinder(height * 2, radius, radius);
}
