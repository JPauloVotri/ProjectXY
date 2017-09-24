if (place_meeting(x, y, oWater) && !inWater)
  inWater = true;
if (!place_meeting(x, y, oWater) && inWater)
  inWater = false;

if (place_free(x, y+1)){
  state = st_air;
  exit;
}

if (keyboard_check(key.right))
  xSpeed = getSpeed();
else if (keyboard_check(key.left))
  xSpeed = -getSpeed();
else{
  state = st_idle;
  exit;
}

if (keyboard_check_pressed(key.jump) && !place_free(x,y+1)){
  ySpeed = -getJumpForce();
  state = st_air;
  exit;
}
