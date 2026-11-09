epsilon = 0.001;
dehumidifierWidth = 150;
dehumidifierDepth = 150;
shelfThickness = 15;
shelfDepth = 95;
numClips = 4;
clipThickness = 5;

// Calculations
clipWidth = dehumidifierWidth / (numClips * 2 + 1);

union() {
cube([dehumidifierWidth, dehumidifierDepth, shelfThickness], center = true);

translate([dehumidifierDepth / 2.9, 0, 0])
cylinder(shelfThickness, dehumidifierWidth / 3, dehumidifierWidth / 2, center = true);

translate([-dehumidifierDepth / 5.5, -clipWidth * 3, -shelfThickness / 2 - clipThickness / 2])
difference() {
cube([shelfDepth, clipWidth, clipThickness + shelfThickness], center = true);
translate([-clipThickness / 2, 0, 0])
cube([shelfDepth + (clipThickness / 2) , clipWidth + (2 * epsilon), shelfThickness], center = true);
}

translate([-dehumidifierDepth / 5.5, -clipWidth, -shelfThickness / 2 - clipThickness / 2])
difference() {
cube([shelfDepth, clipWidth, clipThickness + shelfThickness], center = true);
translate([-clipThickness / 2, 0, 0])
cube([shelfDepth + (clipThickness / 2) , clipWidth + (2 * epsilon), shelfThickness], center = true);
}

translate([-dehumidifierDepth / 5.5, clipWidth, -shelfThickness / 2 - clipThickness / 2])
difference() {
cube([shelfDepth, clipWidth, clipThickness + shelfThickness], center = true);
translate([-clipThickness / 2, 0, 0])
cube([shelfDepth + (clipThickness / 2) , clipWidth + (2 * epsilon), shelfThickness], center = true);
}

translate([-dehumidifierDepth / 5.5, clipWidth * 3, -shelfThickness / 2 - clipThickness / 2])
difference() {
cube([shelfDepth, clipWidth, clipThickness + shelfThickness], center = true);
translate([-clipThickness / 2, 0, 0])
cube([shelfDepth + (clipThickness / 2) , clipWidth + (2 * epsilon), shelfThickness], center = true);
}
}

