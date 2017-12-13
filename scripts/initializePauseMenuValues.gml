/// initializePauseMenuValues();

PAUSETEXTX = display_get_gui_width() / 3;
PAUSETEXTY = 25;

MAPRADIUS = 13;
XMAP = round(display_get_gui_width()/2 - (MAPRADIUS * 32) - 16);
YMAP = round(display_get_gui_height() * (13/24) - (MAPRADIUS * 18) - 9);

BUTTONW = (display_get_gui_width()/3)-1;
BUTTONH = 48;

RETURNBUTTONX = 0;
RETURNBUTTONY = 0;
RETURNTEXTX = display_get_gui_width()/6;
RETURNTEXTY = 24;
RETURNTEXTCOLOUR = $000099;

CONFIGBUTTONX = BUTTONW + 1;
CONFIGBUTTONY = 0;
CONFIGTEXTX = display_get_gui_width()/2;
CONFIGTEXTY = 24;
CONFIGTEXTCOLOUR = $009900;

EXITBUTTONX = CONFIGBUTTONX + BUTTONW + 1;
EXITBUTTONY = 0;
EXITTEXTX = display_get_gui_width() * (5/6);
EXITTEXTY = 24;
EXITTEXTCOLOUR = $990000;
