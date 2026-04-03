
module heart(width, height = 0) { // 0 = auto height
    w = width; h = height;
    r = 2 * w/7; // top circle radius
    i = r/4.0; // top circle intersect-part width
    rc = 2.0 * r; // center circle raidus
    rb = 3.0 * rc; // bottom circel radius
    j = rb/3; // bottom circle join-part width

    // center y offset
    yc = sqrt((rc -r) * (rc -r) - (r -i) * (r -i));
    wh = [2.0* rc * (r - i) / (rc - r), rc - yc];

    // bottom y offset
    yb = 2 * rb / sqrt(3) - yc;
    
    // bottom rectangle offset, width, height
    yt = rc * (yc + yb) / (rc + rb) - yc;
    wb = 2.0 * rc * (rb -j) /(rb +rc);
    hb = yb - sqrt(rb * rb - (rb -j) * (rb -j));
  
    // height of the heart
    h0 = r +yb - sqrt(rb *rb - (rb -j) * (rb -j));

    scale([1, h > 0 && h != h0 ? h/h0 : 1]) union() {
        translate([-r +i, 0, 0]) circle(r);
        translate([r -i, 0, 0]) circle(r);
        intersection() {
            translate([0, yc, 0]) circle(rc);
            translate([-wh[0]/2.0, yc -rc, 0]) square(wh);
        } 
        difference() {
           translate([-wb/2.0, -yt -hb]) square([wb, hb]);
           union() {
                translate([-rb +j, -yb, 0]) circle(rb);
                translate([rb -j, -yb, 0]) circle(rb);
            }
        }
    }
}
