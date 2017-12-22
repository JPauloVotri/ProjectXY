/// drawMap(xTileRoom, yTileRoom, xDraw, yDraw, [radius]);
var xTileRoom = argument0 + global.mapRoomX;
var yTileRoom = argument1 + global.mapRoomY;
var xDraw = argument2;
var yDraw = argument3;
var radius = argument4;

//--- Calcula diâmetro do mapa ---
var diameter = radius * 2;

//--- Carrega os mapas ---
var mapEntrance = global.map[? "mapEntrance"];
var mapNormal = global.map[? "mapNormal"];
var mapHiddenLevel = global.map[? "mapHiddenLevel"];

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
var playerRoomTileX = floor(oPlayer.x / view_wview) + global.mapRoomX;
var playerRoomTileY = floor(oPlayer.y / view_hview) + global.mapRoomY;
var playerTileX = -1;
var playerTileY = -1;

//--- Inicia variável que informa se a tile já foi visitada ou não ---
var isVisited = global.map[? string(playerRoomTileX)+"-"+string(playerRoomTileY)+"Visited"];

//--- Altera informação de visita caso a tile tenha sido visitada ---
if (!isVisited)
  global.map[? string(playerRoomTileX)+"-"+string(playerRoomTileY)+"Visited"] = true;

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
    isVisited = global.map[? string(xPosition)+"-"+string(yPosition)+"Visited"];
    hiddenLevel = mapHiddenLevel[? string(xPosition)+"-"+string(yPosition)+"HiddenLevel"];
    
    //--- Carrega posição da tile de fundo no Tileset e desenha ---
    tileLeft = mapNormal[? string(xPosition)+"-"+string(yPosition)+"x"];
    tileTop = mapNormal[? string(xPosition)+"-"+string(yPosition)+"y"];
    
    if ((!is_undefined(tileLeft) || !is_undefined(tileTop)) && (hiddenLevel == 0 || isVisited || (global.mapRevealed && hiddenLevel <= 1)))
      draw_background_part(bgNormalMapTileset, tileLeft, tileTop + (133 * isVisited), 32, 18, tileXDraw, tileYDraw);
    else
      draw_background_part(bgNormalMapTileset, 0, 0, 32, 18, tileXDraw, tileYDraw);
    
    //--- Carrega posição da tile de entrada no Tileset e desenha ---
    tileLeft = mapEntrance[? string(xPosition)+"-"+string(yPosition)+"x"];
    tileTop = mapEntrance[? string(xPosition)+"-"+string(yPosition)+"y"];
    
    if ((!is_undefined(tileLeft) || !is_undefined(tileTop)) && isVisited)
      draw_background_part(bgEntrancesMapTileset, tileLeft, tileTop, 32, 18, tileXDraw, tileYDraw);
  }
}

//--- Desenha sprite de localização do jogador no mapa ---
if (playerTileX != -1 && playerTileY != -1)
  draw_sprite(sMapLocation, global.mapPositionOn, playerTileX, playerTileY);
