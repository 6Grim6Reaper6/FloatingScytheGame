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
if (attackFrame == 0)
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
}
else
{
	if (attack == 1) 
	{
		sprite_index = sPlayerAttackOne;
	}
	else
	{
		sprite_index = sPlayerAttackTwo;
	}
}


//set the collision mask
mask_index = maskSpr;


//Draw myself
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha - ((iFrames % 10 ) * 0.1));


xspd = 0;