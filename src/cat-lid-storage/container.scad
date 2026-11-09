include <BOSL2/std.scad>;
include <BOSL2/threading.scad>;

lidDiameter = 93;
lidHeight = 10;
lidTabWidth = 34;
lidCount = 9;
baseHeight = 10;
wallWidth = 5;
epsilon = 0.001;

difference() {
    // Outer ring
    union() {
        cylinder(
            lidHeight * lidCount + (baseHeight * 2.5),
            lidDiameter / 2 + wallWidth, 
            lidDiameter / 2 + wallWidth,
            $fn=256
        );
    }
    
    // Inner ring
    translate([0, 0, wallWidth + baseHeight])
    cylinder(lidHeight * lidCount, lidDiameter / 2, lidDiameter / 2, $fn=256);
    
    // Tab slot
    translate([20, -lidTabWidth / 2, wallWidth + baseHeight])
    cube([lidTabWidth, lidTabWidth, lidHeight * lidCount]);
    
    translate([0, -lidDiameter / 1.5, baseHeight + wallWidth + epsilon])
    cube([lidDiameter, lidDiameter * 1.25, lidHeight * 1.225]);
    
    translate([0, 0, lidHeight * lidCount + (baseHeight * 2) + epsilon])
    threaded_rod(d = lidDiameter, l = baseHeight * 1.5, pitch = 2);
}
