include <BOSL2/std.scad>
include <BOSL2/screws.scad>

screwHeadDiameter = 25;
screwSize = 20;
screwLength = 20;
threadPitch = 2;

screw(
    str("M",screwSize,"x",threadPitch),
    "socket",
    bevel1=true,
    l=screwLength
);