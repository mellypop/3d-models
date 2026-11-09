include <BOSL2/std.scad>;
include <BOSL2/threading.scad>;

lidDiameter = 93;
lidHeight = 10;
lidTabWidth = 33;
lidCount = 9;
baseHeight = 10;
wallWidth = 5;
epsilon = 0.001;
capRadius = ((lidDiameter / 2) + wallWidth) * 1.25;

module cap($fn=512) {
   scale([1, 1, .65])
    difference() {
        sphere(capRadius) {
            align(TOP,RIGHT, inside=true, shiftout=0)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(TOP,LEFT, inside=true, shiftout=-4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(TOP+(BACK/3)+(RIGHT/2), inside=true, shiftout=0)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(BACK, TOP, inside=true, inset=10)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(TOP,(FRONT/3) + (RIGHT/3), inside=true, shiftout=-4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(TOP,(BACK/3) + (LEFT/3), inside=true, shiftout=-4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(TOP,(FRONT*2), inside=true, shiftout=-4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=10);
            
            align(LEFT,FRONT+TOP, inside=true, shiftout=0)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=50);
           align(RIGHT,FRONT+TOP, inside=true, shiftout=-4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=50);
            align(BACK,TOP+LEFT, inside=true, shiftout=-4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=50);
            align(BACK,RIGHT+TOP, inside=true, shiftout=4)
                orient(BOTTOM+RIGHT)
                    sphere(5, anchor=BOT+RIGHT, spin=50);
        }
        
        translate([-capRadius, -capRadius, -capRadius])
        cube([capRadius * 2, capRadius * 2, capRadius]);
    } 
}

union() {
    diff() {
    cap()
        align(TOP,RIGHT, inside=true, shiftout=0.01)
                sphere(100);
    }

    translate([0, 0, -baseHeight / 3])
    threaded_rod(d = lidDiameter, l = baseHeight, pitch = 2);
}