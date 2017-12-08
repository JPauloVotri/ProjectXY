if (place_meeting(x, y, oWater) && !inWater)
  inWater = true;
else if (!place_meeting(x, y, oWater) && inWater)
  inWater = false;


if (!place_meeting(x, y+1, oBlock))
  grav = getGravityForce();
else{
  grav = 0;
  xSpeedSign = 0;
  state = st_idle;
  exit;
}

if (keyboard_check_released(key.jump) && ySpeed < 0)
  ySpeed /= 2;

if (keyboard_check(key.right))    {
  if (xSpeedSign != 1) || (xSpeed == 0){
    xSpeedSign = 0;
    xSpeed = AIRSPEED;
  }
}else if (keyboard_check(key.left)){
  if ((xSpeedSign != -1) || (xSpeed == 0)){
    xSpeedSign = 0;
    xSpeed = -AIRSPEED;
  }
}

var ySpeedAbs = abs(ySpeed);
var ySpeedAbsFloor = floor(ySpeedAbs);
var tempBbTop = bbTop;

repeat (ySpeedAbsFloor){
  if (position_meeting(bbFace+dir, tempBbTop, oBlock) && !position_meeting(bbFace+dir, tempBbTop-1, oBlock) && (ySpeedSign > 0) && (dir != 0)){
    hangingDir = dir;
    ySpeed = 0;
    grav = 0;
    y += tempBbTop-bbTop;
    state = st_hanging;
    exit;
  }else
    tempBbTop++;
}
