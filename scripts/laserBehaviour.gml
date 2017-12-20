/// laserBehaviour(length, precision, colour);
/*
  Calcula e desenha onde o laser deve ir usando colisões do tipo RayCasting.

  Script de laser - By: Rilin (https://youtu.be/x6AADYRsU0o);
*/

var length = argument0;
var precision = argument1;
var colour = argument2;

var dis = 0;

for (var i = 0; (i < length) && (!collision_point(x + lengthdir_x(i, aimAngle), y + lengthdir_y(i, aimAngle), oBlock, 1, true)); i += precision)
  dis = i;

//two sets of coords of where the laser ends
x1 = x
y1 = y
x2 = x + lengthdir_x(dis + precision, aimAngle);
y2 = y + lengthdir_y(dis + precision, aimAngle);

drawLaser(x1, y1, x2, y2, 2, colour);
