/// drawHud();

//--- Map ---
mapPositionTick++;

if (mapPositionTick >= 60)
  mapPositionTick = 0;

draw_roundrect(XMAP-6, YMAP-6, XMAP+32*5+5, YMAP+18*5+5, false);

for (var i = 0; i < 5; i++){
  for (var j = 0; j < 5; j++){
    draw_background_part(bgNormalMapTileset, 0, 0, 32, 18, XMAP+i*32, YMAP+j*18);
  }
}
drawMap(map, floor(x/view_wview[0]), floor(y/view_hview[0]), 28, 20);
draw_sprite(sMapLocation, floor(mapPositionTick/30), XMAP+64, YMAP+36);
