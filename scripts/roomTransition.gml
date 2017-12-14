/// roomTransition(nextRoom, horizontalTransition, xTo, yTo);

if (!instance_exists(oTransition)){
  global.inRoomTransition = true;
  
  with (instance_create(0, 0, oTransition)){
    nextRoom = argument0;
    horizontalTransition = argument1;
    xTo = argument2;
    yTo = argument3;
  }
}
