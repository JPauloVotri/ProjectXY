/// scanMap();

var roomTileWidth = ceil(room_width / 32);
var roomTileHeight = ceil(room_height / 18);

var mapEntrance = ds_map_create();
var mapNormal = ds_map_create();
var mapSpecial = ds_map_create();

var maxTileRight = 0;
var maxTileBottom = 0;

for (var i = 0; i <= roomTileWidth; i++){
  for (var j = 0; j <= roomTileHeight; j++){
    if (tile_layer_find(3, i*32, j*18) != -1){
      ds_map_add(mapSpecial, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(3, i*32, j*18)));
      ds_map_add(mapSpecial, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(3, i*32, j*18)));
      
      show_debug_message(string(i)+"-"+string(j)+"x"+"(Special): "+string(getTileLeft(tile_layer_find(3, i*32, j*18))/33));
      show_debug_message(string(i)+"-"+string(j)+"y"+"(Special): "+string(getTileTop(tile_layer_find(3, i*32, j*18))/19));
    }
    
    if (tile_layer_find(1, i*32, j*18) != -1){
      ds_map_add(mapEntrance, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(1, i*32, j*18)));
      ds_map_add(mapEntrance, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(1, i*32, j*18)));
      
      show_debug_message(string(i)+"-"+string(j)+"x"+"(Entrance): "+string(getTileLeft(tile_layer_find(1, i*32, j*18))/33));
      show_debug_message(string(i)+"-"+string(j)+"y"+"(Entrance): "+string(getTileTop(tile_layer_find(1, i*32, j*18))/19));
    }
    
    if (tile_layer_find(2, i*32, j*18) != -1){
      ds_map_add(mapNormal, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(2, i*32, j*18)));
      ds_map_add(mapNormal, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(2, i*32, j*18)));
      
      show_debug_message(string(i)+"-"+string(j)+"x"+"(Normal): "+string(getTileLeft(tile_layer_find(2, i*32, j*18))/33));
      show_debug_message(string(i)+"-"+string(j)+"y"+"(Normal): "+string(getTileTop(tile_layer_find(2, i*32, j*18))/19));
    }
  }
}

var map = ds_map_create();
ds_map_add(map, "maxTileRight", maxTileRight);
ds_map_add(map, "maxTileBottom", maxTileBottom);
ds_map_add_map(map, "mapEntrance", mapEntrance);
ds_map_add_map(map, "mapNormal", mapNormal);
ds_map_add_map(map, "mapSpecial", mapSpecial);

return map;

