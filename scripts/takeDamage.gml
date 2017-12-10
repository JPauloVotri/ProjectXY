/// takeDamage(amount, hurtDirection);
var amount = argument0;
var dir = argument1;

state = st_air;
ySpeed = round(sin(degtorad(dir))*5);
xSpeed = round(-cos(degtorad(dir))*5);
decreaseLife(amount);
