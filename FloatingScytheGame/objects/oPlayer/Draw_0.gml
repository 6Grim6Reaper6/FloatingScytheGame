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


//Draw myself
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha);