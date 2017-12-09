/// drawHud();

//--- Extra Lifes ---
if (extraLifesTotal > 0){
  draw_set_colour($000000);
  draw_roundrect(XXLIFES - 10, YXLIFES - 6, XXLIFES + extraLifesTotal*15, YXLIFES + 15, false);
  if (extraLifes > 0){
    draw_set_colour($A61A3B);
    for (var i = 0; i < extraLifes; i++){
      draw_rectangle(XXLIFES + 15*i, YXLIFES, XXLIFES + 10 + 15*i, YXLIFES + 10, false);
    }
  }
  draw_set_colour($4E0416);
  for (var i = 0; i < extraLifesTotal-extraLifes; i++){
    draw_rectangle(XXLIFES + extraLifes*15 + 15*i, YXLIFES, XXLIFES + extraLifes*15 + 10 + 15*i, YXLIFES + 10, false);
  }
}

//--- HP ---
draw_set_colour($000000);
draw_roundrect(XHP - 30, YHP - 26, XHP + 25, YHP+25, false);

draw_set_colour($4A7700);
draw_rectangle(XHP - 20, YHP - 20, XHP + 20, YHP+20, false);

draw_set_font(fHud);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour($77C000);
draw_text(XHP, YHP, hp);

//--- Map ---
mapPositionTick++;

if (mapPositionTick >= 60)
  mapPositionTick = 0;

draw_set_colour($000000);
draw_roundrect(XMAP-6, YMAP-6, XMAP+32*5+5, YMAP+18*5+5, false);

for (var i = 0; i < 5; i++){
  for (var j = 0; j < 5; j++){
    draw_background_part(bgNormalMapTileset, 0, 0, 32, 18, XMAP+i*32, YMAP+j*18);
  }
}
drawMap(map, floor(x/view_wview[0]), floor(y/view_hview[0]), 28, 20);
draw_sprite(sMapLocation, floor(mapPositionTick/30), XMAP+64, YMAP+36);
