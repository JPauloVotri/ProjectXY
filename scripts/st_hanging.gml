if !(hangingUp){
  if (keyboard_check_pressed(key.down)){
    state = st_air;
    exit;
  }else if (keyboard_check_pressed(key.up)){
    tempY = y;
    tempX = x;
    hangingUp = true;
  }
}else{
  if (y > tempY - 160)
    ySpeed = -getHangingUpSpeed();
  else{
    ySpeed = 0;
    xSpeed = getHangingUpSpeed() * hangingDir;
  }
  
  if ((xSpeed < 0 && x == tempX - 64) || (xSpeed > 0 && x == tempX + 64)){
    xSpeed = 0;
    hangingUp = false;
    state = st_idle;
  }
}
