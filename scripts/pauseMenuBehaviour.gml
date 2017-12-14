/// pauseMenuBehaviour();

if (mouse_check_button_pressed(mb_left) && global.gamePaused && !global.inRoomTransition){
  var xMouse = mouse_x - view_xview;
  var yMouse = mouse_y - view_yview;

  if (xMouse >= RETURNBUTTONX && yMouse >= RETURNBUTTONY && xMouse <= RETURNBUTTONX + BUTTONW && yMouse <= RETURNBUTTONY + BUTTONH)
    global.gamePaused = false;
  
  //if (xMouse >= CONFIGBUTTONX && yMouse >= CONFIGBUTTONY && xMouse <= CONFIGBUTTONX + BUTTONW && yMouse <= CONFIGBUTTONY + BUTTONH)
    // TODO
  
  if (xMouse >= EXITBUTTONX && yMouse >= EXITBUTTONY && xMouse <= EXITBUTTONX + BUTTONW && yMouse <= EXITBUTTONY + BUTTONH)
    game_end();
}
