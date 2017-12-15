if (place_meeting(x, y, oWater) && !inWater)
  inWater = true;
if (!place_meeting(x, y, oWater) && inWater)
  inWater = false;

if (!place_meeting(x, y+1, oBlock)){
  state = st_air;
  exit;
}

if (wantMove)
  xSpeed = getSpeed()*dir
else{
  state = st_idle;
  exit;
}

if (keyboard_check_pressed(key.jump) && place_meeting(x, y+1, oBlock)){
  ySpeed = -getJumpForce();
  state = st_air;
  exit;
}
