/// scanMap();

//--- Coleta tamanho da room em Tiles ---
var roomTileWidth = ceil(room_width / 32);
var roomTileHeight = ceil(room_height / 18);

//--- Cria os mapas ---
var map = ds_map_create();
var mapEntrance = ds_map_create();
var mapNormal = ds_map_create();
var mapHiddenLevel = ds_map_create();

//--- Escaneia a room à procura de tiles ---
for (var i = 0; i <= roomTileWidth; i++){
  for (var j = 0; j <= roomTileHeight; j++){
    //--- Camada de fundo ---
    if (tile_layer_find(3, i*32, j*18) != -1){
      ds_map_add(map, string(i)+"-"+string(j)+"Visited", false);
      
      ds_map_add(mapNormal, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(3, i*32, j*18)));
      ds_map_add(mapNormal, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(3, i*32, j*18)));
      
      show_debug_message(string(i)+"-"+string(j)+"x"+"(Normal): "+string(getTileLeft(tile_layer_find(3, i*32, j*18))/33));
      show_debug_message(string(i)+"-"+string(j)+"y"+"(Normal): "+string(getTileTop(tile_layer_find(3, i*32, j*18))/19));
    }
    
    //--- Camada de entradas ---
    if (tile_layer_find(2, i*32, j*18) != -1){
      ds_map_add(mapEntrance, string(i)+"-"+string(j)+"x", getTileLeft(tile_layer_find(2, i*32, j*18)));
      ds_map_add(mapEntrance, string(i)+"-"+string(j)+"y", getTileTop(tile_layer_find(2, i*32, j*18)));
      
      show_debug_message(string(i)+"-"+string(j)+"x"+"(Entrance): "+string(getTileLeft(tile_layer_find(2, i*32, j*18))/33));
      show_debug_message(string(i)+"-"+string(j)+"y"+"(Entrance): "+string(getTileTop(tile_layer_find(2, i*32, j*18))/19));
    }
    
    //--- Nível de segurança ---
    if (tile_layer_find(1, i*32, j*18) != -1){
      ds_map_add(mapHiddenLevel, string(i)+"-"+string(j)+"HiddenLevel", getTileTop(tile_layer_find(1, i*32, j*18))/19);
      
      show_debug_message(string(i)+"-"+string(j)+"HiddenLevel: "+string(getTileTop(tile_layer_find(1, i*32, j*18))/19));
    }
    
    
  }
}

ds_map_add_map(map, "mapEntrance", mapEntrance);
ds_map_add_map(map, "mapNormal", mapNormal);
ds_map_add_map(map, "mapHiddenLevel", mapHiddenLevel);

return map;

