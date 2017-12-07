/// drawMap(xTileRoom, yTileRoom, xDraw, yDraw);
var map = argument0;
var xTileRoom = argument1;
var yTileRoom = argument2;
var xDraw = argument3;
var yDraw = argument4;

var mapEntrance = ds_map_find_value(map, "mapEntrance");
var mapNormal = ds_map_find_value(map, "mapNormal");
var mapSpecial = ds_map_find_value(map, "mapSpecial");
var tileLeft;
var tileTop;

var tileXDraw;
var tileYDraw;

for (var i = 0; i <= 4; i++){
  for (var j = 0; j <= 4; j++){
    tileXDraw = 32*i + xDraw;
    tileYDraw = 18*j + yDraw;
    
    /*
    tileLeft = ds_map_find_value(mapSpecial, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"x");
    tileTop = ds_map_find_value(mapSpecial, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"y");
    if (!is_undefined(tileLeft) || !is_undefined(tileTop))
      draw_background_part(bgNormalMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
    */
    
    tileLeft = ds_map_find_value(mapNormal, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"x");
    tileTop = ds_map_find_value(mapNormal, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"y");
    if (!is_undefined(tileLeft) || !is_undefined(tileTop))
      draw_background_part(bgNormalMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
    
    tileLeft = ds_map_find_value(mapEntrance, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"x");
    tileTop = ds_map_find_value(mapEntrance, string(i+xTileRoom-2)+"-"+string(j+yTileRoom-2)+"y");
    if (!is_undefined(tileLeft) || !is_undefined(tileTop))
      draw_background_part(bgEntrancesMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
  }
}
