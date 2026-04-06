epsilon = 0.001;

module scallopCirclet(
    radius = 100,
    width = 10,
    scallopCount = 32
) {
    circumference = (radius) * PI * 2;
    scallopRadius = circumference / scallopCount;
    scallopRotationStep = 360 / scallopCount;

    intersection() {
        union() {
            difference() {
                cylinder(
                    scallopRadius,
                    radius * 2,
                    radius * 2,
                    $fn = 256
                );

                translate([0, 0, scallopRadius])
                rotate([90, 0, 0 ])
                union() {
                    for(i = [0 : 2 : scallopCount - 1]) {
                        rotate([0, scallopRotationStep * i, 0])
                        cylinder(
                            radius * 2,
                            0,
                            (radius * 4 * PI) / (scallopCount * 2),
                            $fn = 256
                        );
                    }
                }
            }
            
            translate([0, 0, scallopRadius])
            rotate([90, 0, 0 ])
            union() {
                for(i = [1 : 2 : scallopCount]) {
                    rotate([0, scallopRotationStep * i, 0])
                    cylinder(
                        radius * 2,
                        0,
                        (radius * 4 * PI) / (scallopCount * 2),
                        $fn = 256
                    );
                }
            }
        }

        translate([
            0,
            0,
            - scallopRadius * 1.5
        ])
        difference() {
            cylinder(
                5 * scallopRadius,
                radius,
                radius,
                $fn = 256
            );
            translate([0, 0, -scallopRadius])
            cylinder(
                7 * scallopRadius,
                radius - width,
                radius - width,
                $fn = 256
            );
        }
    }
}
