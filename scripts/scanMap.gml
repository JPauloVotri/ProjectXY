/// scanMap();

var roomTileWidth = ceil(room_width / 32);
var roomTileHeight = ceil(room_height / 18);

var mapNormal = ds_map_create();
var mapEntrance = ds_map_create();
var mapEspecial = ds_map_create();

for (var i = 0; i <= roomTileWidth; i++){
  for (var j = 0; j <= roomTileHeight; j++){
    if (tile_layer_find(1, i*32, j*18) != -1){
      ds_map_add(mapNormal, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(1, i*32, j*18)));
      ds_map_add(mapNormal, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(1, i*32, j*18)));
    }
    
    if (tile_layer_find(2, i*32, j*18) != -1){
      ds_map_add(mapEntrance, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(2, i*32, j*18)));
      ds_map_add(mapEntrance, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(2, i*32, j*18)));
    }
    
    if (tile_layer_find(3, i*32, j*18) != -1){
      ds_map_add(mapEspecial, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(3, i*32, j*18)));
      ds_map_add(mapEspecial, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(3, i*32, j*18)));
    }
  }
}

var map = ds_map_create();
ds_map_add_map(map, "mapNormal", mapNormal);
ds_map_add_map(map, "mapEntrance", mapEntrance);
ds_map_add_map(map, "mapEspecial", mapEspecial);

return map;

