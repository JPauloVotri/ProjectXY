/// cameraPositioning();

var xPlayer = oPlayer.x;
var yPlayer = oPlayer.y;
var xPlayerSpeedSign = oPlayer.xSpeedSign;
var yPlayerSpeedSign = oPlayer.ySpeedSign;

xTo = xPlayer + xPlayerSpeedSign*xDistance;
yTo = yPlayer + yPlayerSpeedSign*yDistance;

xSpeed = (xTo-x)/SPEED;
ySpeed = (yTo-y)/SPEED;

xSpeed = floor(xSpeed);
ySpeed = floor(ySpeed);

var xSpeedSign = sign(xSpeed);
var ySpeedSign = sign(ySpeed);

var xSpeedAbs = abs(xSpeed);
var ySpeedAbs = abs(ySpeed);

var xTemp = x;
var yTemp = y;

repeat (xSpeedAbs){
  if (place_meeting(xTemp+xSpeedSign, y, oHiddenPlace) && !inHiddenArea){
    xSpeed = 0;
    x = xTemp;
  }else
    xTemp += xSpeedSign;
}

repeat (ySpeedAbs){
  if (place_meeting(x, yTemp+ySpeedSign, oHiddenPlace) && !inHiddenArea){
    ySpeed = 0;
    y = yTemp;
  }else
    yTemp += ySpeedSign;
}

// Move a camera
x += xSpeed;
y += ySpeed;

/*xSpeed = oPlayer.xSpeed;
ySpeed = oPlayer.ySpeed;

var xCameraSpeedAbs = abs(xSpeed);
var yCameraSpeedAbs = abs(ySpeed);

xSpeedSign = oPlayer.xSpeedSign;
ySpeedSign = oPlayer.ySpeedSign;

repeat (xCameraSpeedAbs){
  if (!place_meeting(x+xSpeedSign, y, oHiddenPlace) || position_meeting(oPlayer.x, oPlayer.y, oHiddenPlace))
    x = oPlayer.x;//xSpeedSign;
  else
    xSpeed = 0;
  /*if (place_meeting(x+xSpeedSign, y, oHiddenPlace) &&
      !position_meeting(x, y, oHiddenPlace))
    xSpeed = 0;
  else
    x += xSpeedSign;*-/
}

repeat (yCameraSpeedAbs){
  if (!place_meeting(x, y+ySpeedSign, oHiddenPlace) || position_meeting(oPlayer.x, oPlayer.y, oHiddenPlace))
    y = oPlayer.y;//ySpeedSign;
  else
    ySpeed = 0;
  /*if (place_meeting(x, y+ySpeedSign, oHiddenPlace) &&
      !position_meeting(x, y, oHiddenPlace))
    ySpeed = 0;
  else
    y += ySpeedSign;*-/
}*/
