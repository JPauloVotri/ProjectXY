/// aimBehaviour()

wantAim = keyboard_check(key.aim);
isAiming = wantAim;

var aimUp = keyboard_check(key.aimUp);
var aimDown = keyboard_check(key.aimDown);
var aimLeft = keyboard_check(key.aimLeft);
var aimRight = keyboard_check(key.aimRight);

if (wantAim){
  // Diagonais
  if (aimRight && aimUp)
    aimAngle = 45;
  else if (aimUp && aimLeft)
    aimAngle = 135;
  else if (aimLeft && aimDown)
    aimAngle = 225;
  else if (aimDown && aimRight)
    aimAngle = 315;
  
  // Perpendicular
  else if (aimRight)
    aimAngle = 0;
  else if (aimUp)
    aimAngle = 90;
  else if (aimLeft)
    aimAngle = 180;
  else if (aimDown)
    aimAngle = 270;
  
  // Direção do Mouse
  else
    aimAngle = point_direction(x, y, mouse_x, mouse_y);
}else if (facing < 0)
  aimAngle = 180;
else if (facing > 0)
  aimAngle = 0;

if ((aimAngle < 90 || aimAngle > 270) && facing < 0)
  facing = 1;
if ((aimAngle > 90 && aimAngle < 270) && facing > 0)
  facing = -1;
  
// Muda posição da câmera
oCamera.xTo = x + 256*round(dcos(aimAngle));
oCamera.yTo = y + 128*round(-dsin(aimAngle));
