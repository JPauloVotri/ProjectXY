///drawLaser(x1, y1, x2, y2, width, colour);
/*
  Desenha uma linha entre duas coordenadas de forma que se pareça com um laser.

  Script de laser - By: Rilin (https://youtu.be/x6AADYRsU0o);
*/

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
width = argument4;
colour = argument5;

//Desenha três linhas com diferentes espessuras e modos de combinação para fazer um laser
draw_set_color(colour);
draw_set_alpha(0.05);
draw_line_width(x1, y1, x2, y2, width*8);
draw_line_width(x1, y1, x2, y2, width*7);
draw_line_width(x1, y1, x2, y2, width*6);
draw_set_alpha(0.1);
draw_line_width(x1, y1, x2, y2, width*4);
draw_line_width(x1, y1, x2, y2, width*3);
draw_set_alpha(0.2);
draw_line_width(x1, y1, x2, y2, width*2);
draw_set_alpha(0.3);
draw_line_width(x1, y1, x2, y2, width*1.5);
draw_set_blend_mode(bm_add);
draw_set_alpha(0.6);
draw_line_width(x1, y1, x2, y2, width);
draw_set_color(c_white);
draw_set_alpha(0.2);
draw_line_width(x1, y1, x2, y2, width/2);
draw_set_alpha(1);
draw_set_blend_mode(0);
