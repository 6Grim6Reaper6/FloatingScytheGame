draw_self()

draw_set_font(ft_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//draw_text(x, y, text);
draw_text_ext_transformed(x - (sprite_width / 2) + 4, y - (sprite_height / 2) + 4, text, 20, sprite_width * 2 + 16, 0.4, 0.4, 0);
