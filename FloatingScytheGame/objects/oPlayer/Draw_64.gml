var draw_x = 18;
var draw_y = 18;

//draw soul GUI
draw_set_font(ft_gui);
//draw soul Gui
var _w = display_get_gui_width();
//draw soul sprite
draw_sprite_stretched(sSouls, 0, _w- draw_x-40, draw_y-2,48,64);

//colour
draw_set_color(#00FFFF);

//Draw soul text
draw_set_halign(fa_right);
draw_text_transformed(_w - draw_x*4, draw_y, souls,2,2,0);
draw_set_halign(fa_left);
draw_set_color(c_white);