/// turretShoot(x, y, direction, speed);
var xPos = argument0;
var yPos = argument1
var dir = argument2;
var spd = argument3;

var bullet = instance_create(xPos, yPos, oTurretBullet);

bullet.direction = dir;
bullet.spd = spd;
