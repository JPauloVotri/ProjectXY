/// setResolution(width, height);
var displayWidth = argument0;
var displayHeight = argument1;

// Resolução base
var baseWidth = 1024;
var baseHeight = 576;

// Redimensiona a Gui
display_set_gui_size(baseWidth, baseHeight);

// Redimensiona a janela
window_set_size(displayWidth, displayHeight);

// Proporção da tela
var aspectRatio = baseWidth/baseHeight;

// Calcula a largura e altura
if (displayWidth >= displayHeight){
  var height = min(baseHeight, displayHeight);
  var width = height * aspectRatio;
}

// Redimensiona a Application Surface
surface_resize(application_surface, width, height);
