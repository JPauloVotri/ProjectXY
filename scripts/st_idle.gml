if (place_free(x, y+1)){
  state = st_air;
}

if (place_meeting(x, y+1, oIce)){
  xSpeed *= m_fric;
    
  if (abs(xSpeed) < 0.001)
    xSpeed = 0;
}else if (!wantMove)
  xSpeed = 0;

if (wantMove){
  state = st_moving;
  exit;
}else if (keyboard_check_pressed(key.jump) && !place_free(x,y+1)){
  ySpeed = -getJumpForce();
  xSpeedSign = 0;
  state = st_air;
  exit;
}
