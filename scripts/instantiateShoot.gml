/// instantiateShoot(dir);
var dir = argument0;

var beamInstance = instance_create(x, y, oBeam);

beamInstance.direction = dir;
beamInstance.image_angle = dir;
