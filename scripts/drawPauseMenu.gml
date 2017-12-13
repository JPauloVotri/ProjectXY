/// drawPauseMenu();

// Desenha o fundo
draw_set_colour($000000);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Variáveis do mapa
var xTileRoom = floor((view_xview + view_wview/2) / view_wview);
var yTileRoom = floor((view_yview + view_hview/2) / view_hview);

// Desenha o mapa
drawMap(xTileRoom, yTileRoom, XMAP, YMAP, MAPRADIUS);

// Seleciona fonte e alinhamento
draw_set_font(fHud);
draw_set_halign(fa_middle);
draw_set_valign(fa_center);

// Desenha botão de Retorno
draw_set_colour(RETURNTEXTCOLOUR);
draw_rectangle(RETURNBUTTONX, RETURNBUTTONY, BUTTONW, BUTTONH, false);

draw_set_colour(c_white);
draw_text(RETURNTEXTX, RETURNTEXTY, "RETURN");

// Desenha botão de Configurações
draw_set_colour(CONFIGTEXTCOLOUR);
draw_rectangle(CONFIGBUTTONX, CONFIGBUTTONY, CONFIGBUTTONX+BUTTONW, CONFIGBUTTONY+BUTTONH, false);

draw_set_colour(c_white);
draw_text(CONFIGTEXTX, CONFIGTEXTY, "CONFIGURATIONS");

// Desenha botão de Saída
draw_set_colour(EXITTEXTCOLOUR);
draw_rectangle(EXITBUTTONX, EXITBUTTONY, EXITBUTTONX+BUTTONW, EXITBUTTONY+BUTTONH, false);

draw_set_colour(c_white);
draw_text(EXITTEXTX, EXITTEXTY, "EXIT");
