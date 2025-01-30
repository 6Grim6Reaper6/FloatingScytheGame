with oPlayer{
	if (not split)
	{
		draw_sprite_stretched(sTextbox, 1, oPlayer.x-27 ,y-54, 54, staminabar_height + 8);
		draw_sprite_stretched_ext(sStamina, 0,oPlayer.x-25,y-50,(stamina / stamina_max) * staminabar_width, staminabar_height, c_green, 1);
		draw_sprite_stretched(sTextboxNoback, 1,oPlayer.x-27,y-54,54,staminabar_height+8);

		draw_sprite_stretched(sTextbox, 1,oPlayer.x-27,y-68,54,staminabar_height+8);
		draw_sprite_stretched_ext(sStamina, 0,oPlayer.x-25,y-64,(hp/hp_max) * staminabar_width,staminabar_height,c_red, 1);
		draw_sprite_stretched(sTextboxNoback, 0,oPlayer.x-27,y-68,54,staminabar_height+8);

	}
}