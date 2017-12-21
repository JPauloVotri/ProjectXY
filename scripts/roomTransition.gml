/// roomTransition(nextRoom, nextDoorId, horizontalTransition);

if (!instance_exists(oTransition)){
  global.inRoomTransition = true;
  
  with (instance_create(0, 0, oTransition)){
    nextRoom = argument0;
    nextDoorId = argument1;
    horizontalTransition = argument2;
  }
}
