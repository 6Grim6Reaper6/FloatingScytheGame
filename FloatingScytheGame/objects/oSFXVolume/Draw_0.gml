image_index = clicked;
draw_self()

draw_set_font(ft_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext_transformed_color(x, y - 2, text + string(global.settings.SFX), 20, sprite_width * 2 + 16, 0.4, 0.4, 0, c_white,c_white, c_white, c_white, 1);
