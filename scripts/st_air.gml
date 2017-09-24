if (place_meeting(x, y, oWater) && !inWater)
  inWater = true;
else if (!place_meeting(x, y, oWater) && inWater)
  inWater = false;


if (place_free(x, y+1))
  grav = getGravityForce();
else{
  grav = 0;
  xSign = 0;
  state = st_idle;
  exit;
}

if (keyboard_check_released(key.jump) && ySpeed < 0)
  ySpeed /= 2;

if (keyboard_check(key.right))    {
  if (xSign != 1) || (xSpeed == 0){
    xSign = 0;
    xSpeed = m_airSpd;
  }
}else if (keyboard_check(key.left)){
  if ((xSign != -1) || (xSpeed == 0)){
    xSign = 0;
    xSpeed = -m_airSpd;
  }
}

if (place_meeting(x, y, oGrab) and !place_meeting(x, y+ySpeed, oGrab) && ySpeed > 0 && !place_free(x+dir, y)){
  repeat (abs(ySpeed)){
    y++;
    
    if (!place_meeting(x, y, oGrab)){
      hangingDir = dir;
      ySpeed = 0;
      grav = 0;
      state = st_hanging;
      exit;
    }
  }
}
