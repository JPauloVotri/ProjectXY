/// initializeCameraGrid();
var cellWidth = view_wview/2;
var cellHeight = view_hview/2;

var horizontalCells = room_width div cellWidth;
var verticalCells = room_height div cellHeight;

global.cameraGrid = mp_grid_create(0, 0, horizontalCells, verticalCells, cellWidth, cellHeight);

mp_grid_add_instances(global.cameraGrid, oHiddenPlace, false);
