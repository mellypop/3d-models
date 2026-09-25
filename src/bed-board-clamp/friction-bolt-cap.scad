include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include<../modules/heart.scad>

screwHeadDiameter = 20;
screwSize = 20;
screwLength = 30;
threadPitch = 2;
capHeight = 3;
holeHeight = 0.1;
numSegments = 5;

difference() {
    union() {
        tex = texture("hex_grid");
        translate([
            0,
            0,
            (screwLength / 4) + holeHeight
        ])
        rotate_sweep(
            [
                [0,1],
                [10,1],
                [screwHeadDiameter, 5.4],
                [0,5]
            ],
             tex_reps=[6,6],tex_depth=1.5,
             texture=tex);

        //translate([0, 0, screwLength / 3.5])
        //cylinder(holeHeight, screwSize * 0.75, screwSize * 0.75);
    }
    
    translate([0, 0, 0.2])
    screw_hole(
        str("M",screwSize,"x",threadPitch),
        thread=true,
        l=screwLength
    );
}


