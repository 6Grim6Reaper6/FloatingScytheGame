if (split)
{
	maskSpr = sPlayerIdleScythe;
	idleSpr = sPlayerIdleScythe;
	walkSpr = sPlayerWalkScythe;
	runSpr = sPlayerRunScytheTest;
	slideSpr = sPlayeSlideScythe;
	jumpSpr = sPlayerRunScytheTest;
}
else
{
	maskSpr = sPlayerIdle;
	idleSpr = sPlayerIdle;
	walkSpr = sPlayerWalk;
	runSpr = sPlayerRunTest;
	slideSpr = sPlayeSlide;
	jumpSpr = sPlayerJump;
}


//Sprite Control
//Walking
face = xDir;
if (attackFrame == 0 and attackCharge == 0 and throwTimer == 0)
{
	if (abs(xspd) > 0) {sprite_index = walkSpr;};
	//Running
	if (abs(xspd) >= moveSpd[1]) {sprite_index = runSpr;};
	//not moving
	if xspd == 0 {sprite_index = idleSpr;};
	//In the air
	if (not onGround)
	{
		if (onWall != 0)
		{
			if (not split) { face *= -1; }
			sprite_index = slideSpr;
		}
		else{
		sprite_index = jumpSpr;
		}
	}
	//set the collision mask
	mask_index = maskSpr;
}
else
{
	if (split)
	{
		sprite_index = sPlayerScytheAttack;
		mask_index = sPlayerScytheAttack;
	}
	else
	{
		if (attack == 1) 
		{
			if (abs(xspd) >= moveSpd[1])
			{
				sprite_index = sPlayerRunAttack;
				mask_index = sPlayerRunAttack;
			}
			else
			{
				sprite_index = sPlayerAttackOne;
				mask_index = sPlayerAttackOne;
			}
		}
		else
		{
			sprite_index = sPlayerAttackTwo;
			mask_index = sPlayerAttackTwo;
		}
	}
}





//Draw myself
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha - ((iFrames % 10 ) * 0.1));
/*
if (not split)
{
	draw_sprite_stretched(sTextbox, 1,oPlayer.x-27,y-54,54,staminabar_height+8);
	draw_sprite_stretched_ext(sStamina, 0,oPlayer.x-25,y-50,(stamina/stamina_max) * staminabar_width,staminabar_height,c_green, 1);
	draw_sprite_stretched(sTextboxNoback, 1,oPlayer.x-27,y-54,54,staminabar_height+8);

	draw_sprite_stretched(sTextbox, 1,oPlayer.x-27,y-68,54,staminabar_height+8);
	draw_sprite_stretched_ext(sStamina, 0,oPlayer.x-25,y-64,(hp/hp_max) * staminabar_width,staminabar_height,c_red, 1);
	draw_sprite_stretched(sTextboxNoback, 0,oPlayer.x-27,y-68,54,staminabar_height+8);
} */
xspd = 0;