include<../modules/heart.scad>

epsilon = 0.001;

innerDiameter = 120;
innerHeight = 18;
wallWidth = 2;
floorHeight = 5;
scallopRadius = 7;

diameter = innerDiameter + (wallWidth * 2);
height = innerHeight + floorHeight;

scallopRotationStep = 180 / (scallopRadius * 2);

radius = diameter / 2;
innerRadius = innerDiameter / 2;

union() {
    difference() {
        difference() {
            union() {
                difference() {
                    union() {
                        cylinder(height, radius, radius);
                        translate([
                            0,
                            0,
                            floorHeight + epsilon
                        ])
                        rotate([0, 0, scallopRotationStep])
                        union() {
                            for(i = [0:2:floor(180 / scallopRotationStep) - 1]) {
                                rotate([0, 0, scallopRotationStep * i])
                                translate([0, innerRadius * 1.5, height - (scallopRadius)])
                                rotate([90, 0, 0 ])
                                cylinder(
                                    innerRadius * 3,
                                    scallopRadius,
                                    scallopRadius
                                );
                            }
                        }
                    }
                    translate([0,0,floorHeight])
                    cylinder(
                        innerHeight * 4,
                        innerRadius,
                        innerRadius
                    );
                    translate([innerDiameter / 4 + 5, -3, 0])
                    rotate([0, 180, 0])
                    linear_extrude(height = 1)
                    text("mellypop :3");
                }
                
            }

            union() {
                for(i = [0:2:floor(180 / scallopRotationStep) - 1]) {
                    rotate([0, 0, scallopRotationStep * i])
                    translate([0, innerRadius * 1.5, height + (scallopRadius / 4)])
                    rotate([90, 0, 0 ])
                    cylinder(
                        innerRadius * 3,
                        scallopRadius,
                        scallopRadius
                    );
                }
            }
        }

        difference() {
            cylinder(height * 2, radius * 2, radius * 2);
            translate([0, 0, epsilon])
            cylinder(height * 2 + (epsilon * 2), radius + epsilon, radius + epsilon);
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
