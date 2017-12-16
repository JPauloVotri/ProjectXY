/// drawMap(xTileRoom, yTileRoom, xDraw, yDraw, [radius]);
var xTileRoom = argument0 + global.mapRoomX;
var yTileRoom = argument1 + global.mapRoomY;
var xDraw = argument2;
var yDraw = argument3;
var radius = argument4;

//--- Calcula diâmetro do mapa ---
var diameter = radius * 2;

//--- Carrega os mapas ---
var mapEntrance = ds_map_find_value(global.map, "mapEntrance");
var mapNormal = ds_map_find_value(global.map, "mapNormal");
var mapHiddenLevel = ds_map_find_value(global.map, "mapHiddenLevel");

//--- Inicia variáveis de posição da tile no Tileset ---
var tileLeft;
var tileTop;

//--- Inicia variáveis de posição da tile na GUI ---
var tileXDraw;
var tileYDraw;

//--- Inicia variáveis de posição da tile no mapa ---
var xPosition;
var yPosition;

//--- Inicia variáveis de posição do Player ---
var playerRoomTileX = floor((view_xview + view_wview / 2) / view_wview) + global.mapRoomX;
var playerRoomTileY = floor((view_yview + view_hview / 2) / view_hview) + global.mapRoomY;
var playerTileX = -1;
var playerTileY = -1;

//--- Inicia variável que informa se a tile já foi visitada ou não ---
var isVisited = ds_map_find_value(global.map, string(playerRoomTileX)+"-"+string(playerRoomTileY)+"Visited");

//--- Altera informação de visita caso a tile tenha sido visitada ---
if (!isVisited)
  ds_map_replace(global.map, string(playerRoomTileX)+"-"+string(playerRoomTileY)+"Visited", true);

//--- Gerenciamento de variáveis de tempo da sprite de localização no mapa ---
if (global.mapPositionTick >= global.gameFps*0.5){
  global.mapPositionTick = 0;
  global.mapPositionOn = !global.mapPositionOn;
}

//--- Desenha o mapa ---
for (var i = 0; i <= diameter; i++){
  for (var j = 0; j <= diameter; j++){
    //--- Calcula posição de desenho na GUI ---
    tileXDraw = 32*i + xDraw;
    tileYDraw = 18*j + yDraw;
    
    //--- Calcula posição da tile no mapa ---
    xPosition = i + xTileRoom - radius;
    yPosition = j + yTileRoom - radius;
    
    //--- Calcula posição do player no mapa ---
    if (xPosition == playerRoomTileX)
      playerTileX = tileXDraw;
    if (yPosition == playerRoomTileY)
      playerTileY = tileYDraw;
    
    //--- Carrega informações de visita e do nível de ocultação --- 
    isVisited = ds_map_find_value(global.map, string(xPosition)+"-"+string(yPosition)+"Visited");
    hiddenLevel = ds_map_find_value(mapHiddenLevel, string(xPosition)+"-"+string(yPosition)+"HiddenLevel");
    
    //--- Carrega posição da tile de fundo no Tileset e desenha ---
    tileLeft = ds_map_find_value(mapNormal, string(xPosition)+"-"+string(yPosition)+"x");
    tileTop = ds_map_find_value(mapNormal, string(xPosition)+"-"+string(yPosition)+"y");
    
    if ((!is_undefined(tileLeft) || !is_undefined(tileTop)) && (hiddenLevel == 0 || isVisited || (global.mapRevealed && hiddenLevel <= 1)))
      draw_background_part(bgNormalMapTileset, tileLeft, tileTop + (133 * isVisited), 32, 18, tileXDraw, tileYDraw);
    else
      draw_background_part(bgNormalMapTileset, 0, 0, 32, 18, tileXDraw, tileYDraw);
    
    //--- Carrega posição da tile de entrada no Tileset e desenha ---
    tileLeft = ds_map_find_value(mapEntrance, string(xPosition)+"-"+string(yPosition)+"x");
    tileTop = ds_map_find_value(mapEntrance, string(xPosition)+"-"+string(yPosition)+"y");
    
    if ((!is_undefined(tileLeft) || !is_undefined(tileTop)) && isVisited)
      draw_background_part(bgEntrancesMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
  }
}

//--- Desenha sprite de localização do jogador no mapa ---
if (playerTileX != -1 && playerTileY != -1)
  draw_sprite(sMapLocation, global.mapPositionOn, playerTileX, playerTileY);
