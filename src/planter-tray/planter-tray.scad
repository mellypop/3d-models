epsilon = 0.001;

diameter = 102;
height = 25;

innerDiameter = 95;
innerHeight = 20;

radius = diameter / 2;
innerRadius = innerDiameter / 2;

difference() {
    cylinder(height, radius, radius);
    translate([
        0,
        0,
        height - innerHeight + epsilon
    ])
    #cylinder(innerHeight, innerRadius, innerRadius);
}
