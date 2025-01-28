var draw_x = 18;
var draw_y = 18;

draw_set_font(ft_gui);
var _w = display_get_gui_width();
draw_sprite_stretched(sTextbox, 0, _w - draw_x - 130, draw_y -18, 148, 112);
draw_sprite_stretched(sSouls, 0, _w - draw_x - 40, draw_y+4, 48, 64);

draw_set_color(#00FFFF);

draw_set_halign(fa_right);
draw_text_transformed(_w - draw_x * 4, draw_y+6, souls, 2, 2, 0);
draw_set_halign(fa_left);
draw_set_color(c_white);


