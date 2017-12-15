/// checkCameraPositionLimits()

with (oPlayer){
  var other.hasEmptyPlaceLeft = collision_line(0, y, x, y, oEmptyPlace, false, true);
  var other.hasEmptyPlaceUp = collision_line(x, 0, x, y, oEmptyPlace, false, true);
  var other.hasEmptyPlaceRight = collision_line(x, y, room_width, y, oEmptyPlace, false, true);
  var other.hasEmptyPlaceDown = collision_line(x, y, x, room_height, oEmptyPlace, false, true);
  
  var other.hasHiddenPlaceLeft = collision_line(0, y, x, y, oHiddenPlace, false, true) && !other.inHiddenPlace;
  var other.hasHiddenPlaceUp = collision_line(x, 0, x, y, oHiddenPlace, false, true) && !other.inHiddenPlace;
  var other.hasHiddenPlaceRight = collision_line(x, y, room_width, y, oHiddenPlace, false, true) && !other.inHiddenPlace;
  var other.hasHiddenPlaceDown = collision_line(x, y, x, room_height, oHiddenPlace, false, true) && !other.inHiddenPlace;
  
  var other.borderRight = room_width;
  var other.borderLeft = 0;
  var other.borderDown = room_height;
  var other.borderUp = 0;
  
  if (other.hasEmptyPlaceLeft || other.hasHiddenPlaceLeft){
    for (var i = x; i >= 0; i--){
      if (position_meeting(i, y, oEmptyPlace) || (position_meeting(i, y, oHiddenPlace) && !other.inHiddenPlace)){
        other.borderLeft = i+1;
        break;
      }
    }
  }
  
  if (other.hasEmptyPlaceRight || other.hasHiddenPlaceRight){
    for (var i = x; i <= room_width; i++){
      if (position_meeting(i, y, oEmptyPlace) || (position_meeting(i, y, oHiddenPlace) && !other.inHiddenPlace)){
        other.borderRight = i-1;
        break;
      }
    }
  }
  
  if (other.hasEmptyPlaceUp || other.hasHiddenPlaceUp){
    for (var i = y; i >= 0; i--){
      if (position_meeting(x, i, oEmptyPlace) || (position_meeting(x, i, oHiddenPlace) && !other.inHiddenPlace)){
        other.borderUp = i+1;
        break;
      }
    }
  }
  
  if (other.hasEmptyPlaceDown || other.hasHiddenPlaceDown){
    for (var i = y; i <= room_height; i++){
      if (position_meeting(x, i, oEmptyPlace) || (position_meeting(x, i, oHiddenPlace) && !other.inHiddenPlace)){
        other.borderDown = i-1;
        break;
      }
    }
  }
}
