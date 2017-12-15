if (!place_meeting(x, y+1, oBlock)){
  state = st_air;
}

if (place_meeting(x, y+1, oIce)){
  xSpeed *= FRICTIONFORCE;
    
  if (abs(xSpeed) < 0.001)
    xSpeed = 0;
}else if (!wantMove)
  xSpeed = 0;

if (wantMove){
  state = st_moving;
  exit;
}else if (keyboard_check_pressed(key.jump) && place_meeting(x, y+1, oBlock)){
  ySpeed = -getJumpForce();
  xSpeedSign = 0;
  state = st_air;
  exit;
}
