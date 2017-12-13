/// drawMap(xTileRoom, yTileRoom, xDraw, yDraw, [radius]);
var xTileRoom = argument[0] + global.mapRoomX;
var yTileRoom = argument[1] + global.mapRoomY;
var xDraw = argument[2];
var yDraw = argument[3];
if (argument_count == 5)
  var radius = argument[4];
else
  var radius = 2;

var diameter = radius * 2;

var mapEntrance = ds_map_find_value(global.map, "mapEntrance");
var mapNormal = ds_map_find_value(global.map, "mapNormal");
var mapSpecial = ds_map_find_value(global.map, "mapSpecial");

var tileLeft;
var tileTop;

var tileXDraw;
var tileYDraw;

var playerTileX;
var playerTileY;

if (global.mapPositionTick >= 60)
  global.mapPositionTick = 0;

for (var i = 0; i <= diameter; i++){
  for (var j = 0; j <= diameter; j++){
    tileXDraw = 32*i + xDraw;
    tileYDraw = 18*j + yDraw;
    
    if (i+xTileRoom-radius == floor((view_xview + view_wview / 2) / view_wview))
      playerTileX = tileXDraw;
    if (j+yTileRoom-radius == floor((view_yview + view_hview / 2) / view_hview))
      playerTileY = tileYDraw;
    
    /*
    tileLeft = ds_map_find_value(mapSpecial, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"x");
    tileTop = ds_map_find_value(mapSpecial, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"y");
    if (!is_undefined(tileLeft) || !is_undefined(tileTop))
      draw_background_part(bgNormalMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
    */
    
    tileLeft = ds_map_find_value(mapNormal, string(i+xTileRoom-radius)+"-"+string(j+yTileRoom-radius)+"x");
    tileTop = ds_map_find_value(mapNormal, string(i+xTileRoom-radius)+"-"+string(j+yTileRoom-radius)+"y");
    if (!is_undefined(tileLeft) || !is_undefined(tileTop))
      draw_background_part(bgNormalMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
    else
      draw_background_part(bgNormalMapTileset, 0, 0, 32, 18, tileXDraw, tileYDraw);
    
    tileLeft = ds_map_find_value(mapEntrance, string(i+xTileRoom-radius)+"-"+string(j+yTileRoom-radius)+"x");
    tileTop = ds_map_find_value(mapEntrance, string(i+xTileRoom-radius)+"-"+string(j+yTileRoom-radius)+"y");
    if (!is_undefined(tileLeft) || !is_undefined(tileTop))
      draw_background_part(bgEntrancesMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
  }
}

if (!is_undefined(playerTileX) && !is_undefined(playerTileY))
  draw_sprite(sMapLocation, floor(global.mapPositionTick/30), playerTileX, playerTileY);
