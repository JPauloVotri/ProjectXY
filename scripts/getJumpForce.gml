/// getJumpForce();

var powerUpAddition = JUMPFORCE * 0.3 * powerUps[? "highJump"];
var jumpForce = round(JUMPFORCE + powerUpAddition);

if (inWater && powerUps[? "fluidFriction"])
  return jumpForce / WATERDIVIDER;
  
return jumpForce;
