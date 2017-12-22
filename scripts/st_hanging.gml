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
  if (y > tempY - 128)
    ySpeed = -getHangingUpSpeed();
  else{
    ySpeed = 0;
    xSpeed = getHangingUpSpeed() * hangingDir;
  }
  
  if ((xSpeed < 0 && x <= tempX - 32) || (xSpeed > 0 && x >= tempX + 32)){
    xSpeed = 0;
    jumps = 0;
    hangingUp = false;
    state = st_idle;
  }
}
