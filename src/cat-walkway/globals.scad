// Global settings
buildPlateMax = 256;
buildPlateMargin = 20;
gapHeight = 228.6;
pathHeight = 25;
pathDepth = 228.6;

// Small value to avoid face collisions
epsilon = 0.001;

// Incline specific settings
inclineAngle = 35;
inclinePathLength = 150;

// Connector settings
dovetailCount = 3;

// Support settings
supportColumnCount = 2;
dowelCount = 5;
dowelRadius = 1;
dowelLength = 6;


// Part measurements
screwDiameter = 5;
screwLength = 15;
screwHoleDepth = 20;

// Computed globals
height = pathHeight + gapHeight;
inclineLength = height / tan(inclineAngle);

// Computed connecter globals
dovetailWidth =  (pathDepth / dovetailCount) / (dovetailCount);
dovetailHeight = pathHeight / 2;
dovetailSlide = inclineLength / 4;
dovetailGap = (pathDepth - (dovetailWidth / 2 / dovetailCount)) / (dovetailCount + 1);
dowelGap = pathDepth / (dowelCount + 1);

// Computed support globals
supportColumnRadius = ((pathDepth / supportColumnCount) / supportColumnCount^2);
supportColumnHeight = gapHeight + pathHeight - dovetailHeight - epsilon;
supportColumnGap = pathDepth / (supportColumnCount + 1);

