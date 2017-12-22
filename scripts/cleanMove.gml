/// cleanMove();
/*
  Script de movimento limpo - By: Willy (GMBR);
*/

//--- Adiciona gravidade ---
if (ySpeed < getMaxFallSpeed())
  ySpeed += grav;
else
  ySpeed = getMaxFallSpeed();

//--- Instanciação de variáveis ---
var xSpeedAbs = abs(xSpeed);
var ySpeedAbs = abs(ySpeed);

var xSpeedAbsFloor = floor(xSpeedAbs);
var ySpeedAbsFloor = floor(ySpeedAbs);

var xSpeedFloor = floor(xSpeed);
var ySpeedFloor = floor(ySpeed);

//--- Movimentação Horizontal ---
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

//--- Movimentação Vertical ---
ySpeedSign = sign(ySpeed);

repeat (ySpeedAbsFloor){
if (!place_meeting(x, y+ySpeedSign, oBlock)){
    y += ySpeedSign;
  }else{
    ySpeed = 0;
  }
}
