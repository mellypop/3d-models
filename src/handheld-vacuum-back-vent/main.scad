include <BOSL2/std.scad>

epsilon = 0.0001;

//difference(){
//    union(){
//        cylinder(1.2, 44, 44);

//        translate([0,0,1.2])
//        cylinder(9, 39, 39);
//    }
//    cylinder(12, 30, 30);
//}

//translate([0,0,-11])
//sphere(15);

points = [
    [0, 0],
    [2.5, 1],
    [5, 2],
    [7.5, 1],
    [10, 0],
    //[5, -0.5],
    //[6, -1],
    //[7, -0.5],
    //[8, 0]
];
bez = bezier_curve(points, 18);
//debug_bezier(bez);
//polygon(bez);
path = [for(theta=[0, 5, 180]) [theta/10, 10*sin(theta)]];
rotate_sweep(
path_sweep(
    square(0.5),
    bez,
    //texture=texture("bricks"),
    //h=2,
    tex_depth=1/2,
    tex_size=[10,10]
));