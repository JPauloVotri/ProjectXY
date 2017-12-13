//--- Tempo da sprite de posição no mapa ---
global.mapPositionTick++;

//--- Tempo de espera de movimentação do mapa ---
if (mapShiftTick < MAPSHIFTCOOLDOWN)
  mapShiftTick++;

//--- Verifica teclas e move o mapa
if (global.gamePaused && !global.inRoomTransition){
  var mapShiftHDir = keyboard_check(key.right) - keyboard_check(key.left);
  var mapShiftVDir = keyboard_check(key.down) - keyboard_check(key.up);
  
  if ((mapShiftHDir != 0 || mapShiftVDir != 0) && mapShiftTick >= MAPSHIFTCOOLDOWN){
    mapShiftH += mapShiftHDir;
    mapShiftV += mapShiftVDir;
    
    mapShiftTick = 0;
  }
}else{
  mapShiftH = 0;
  mapShiftV = 0;
}
