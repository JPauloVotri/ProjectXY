//Adiciona gravidade
if (ySpeed < m_maxFallSpeed)
  ySpeed += grav;

var xSpeedAbs = abs(xSpeed);
var ySpeedAbs = abs(ySpeed);

var xSpeedAbsFloor = floor(xSpeedAbs);
var ySpeedAbsFloor = floor(ySpeedAbs);

var xSpeedFloor = floor(xSpeed);
var ySpeedFloor = floor(ySpeed);

//Horizontal
xSpeedSign = sign(xSpeed);

repeat(xSpeedAbsFloor){
  if (!place_meeting(x+xSpeedSign, y, oBlock)){
    x += xSpeedSign;
  }else if (!place_meeting(x+xSpeedSign, y-1, oBlock)){
    x += xSpeedSign;
    y--;
  }else{
    xSpeed = 0;
  }
  
  if (!place_meeting(x, y+1, oBlock) && place_meeting(x, y+2, oBlock)){
    y++;
  }
}

//Vertical
ySpeedSign = sign(ySpeed);

repeat (ySpeedAbsFloor){/*
  if (position_meeting(side+dir, top, oBlock) && !position_meeting(side+dir, top-1, oBlock) && (ySpeedSign > 0) && (dir != 0)){
    hangingDir = dir;
    ySpeed = 0;
    grav = 0;
    state = st_hanging;
    exit;
  }*/
  
  if (!place_meeting(x, y+ySpeedSign, oBlock)){
    y += ySpeedSign;
  }else{
    ySpeed = 0;
  }
}
