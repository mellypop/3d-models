include <BOSL2/std.scad>
include <BOSL2/screws.scad>

translate([0, 0, 25])
screw("M6x1,22");

union() {
    // Main body
    translate([-2, -2, 0])
    cube([4, 4, 15]);
    
    prismoid(size1=[5,5], size2=[9,9], h=2);
    
    translate([0, 0, 6])
    prismoid(size1=[5,5], size2=[9.5,9.5], h=2);
    
    translate([-5, -5, 13])
    cube([10, 10, 2]);
    
    translate([0, 4.6, 4.5])
    rotate([90, 0, 0])
    cylinder(9.2, 1, 1);
    
    translate([0, 4.6, 10.5])
    rotate([90, 0, 0])
    cylinder(9.2, 1, 1);
    
    translate([-6.5, -6.5, 7])
    difference() {
        cube([13, 12, 7]);

        translate([1, 1, -1])
        cube([11, 12, 7]);
        
        translate([6.5, 6.5, 0])
        cylinder(5, 6, 5.5);
    }
    
    translate([0, 0, 13])
    cylinder(3, 5, 3.5);
}