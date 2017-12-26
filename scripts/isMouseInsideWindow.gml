/// isMouseInsideWindow();

windowWidth  = window_get_width();
windowHeight = window_get_height();
mouseWindowX = display_mouse_get_x() - window_get_x();
mouseWindowY = display_mouse_get_y() - window_get_y();

if (mouseWindowX >= 0 &&
    mouseWindowY >= 0 &&
    mouseWindowX < windowWidth &&
    mouseWindowY < windowHeight){
  return true;
}else{
  return false;
}
