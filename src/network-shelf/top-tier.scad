/**
 * This model is for a shelf to fit my ASUS RT-AX82U router and will be the top
 * shelf for my homelab network shelf.
 */

plateWidth = 256;
plateBorder = 20;


// 10.25" width router
routerWidth = 261;
// 6.5" deep router
routerDepth = 166;
routerDepthMargin = 20;

// 23mm bottom to bottom of ethernet
backHeight = 23;

shelfHeight = 7;
wallWidth = routerDepthMargin / 3;
wallHeight = backHeight - shelfHeight;

union() {
    // base
    cube(
        [
            plateWidth - plateBorder,
            routerDepth + routerDepthMargin,
            shelfHeight
        ]
    );

    // back wall
    translate([
        0,
        0,//-(routerDepth + routerDepthMargin) / 2,
        shelfHeight
    ])
    cube(
        [
            plateWidth - plateBorder,
            wallWidth,
            backHeight
        ]
    );
}
