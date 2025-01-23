// Throw scythe
if (split)
{
	if (place_meeting(x, y, oBonepile))
	{
		split = false;
		jumpMax = 2;
	
		// Change sprites back
		maskSpr = sPlayerIdle;
		idleSpr = sPlayerIdle;
		walkSpr = sPlayerWalk;
		runSpr = sPlayerRunTest;
		slideSpr = sPlayeSlide;
		jumpSpr = sPlayerJump;
		instance_destroy(instance_nearest(x, y, oBonepile));
	}
}
else
{
	onGround = false;
	var vector = getVector(mouse_x, mouse_y);
	throw_x = vector[0];
	throw_y = vector[1];
	split = true;
	jumpMax = 1;
	throwTimer = 1; 
	
	//Change sprites
	maskSpr = sPlayerIdleScythe;
	idleSpr = sPlayerIdleScythe;
	walkSpr = sPlayerWalkScythe;
	runSpr = sPlayerRunScytheTest;
	slideSpr = sPlayeSlideScythe;
	jumpSpr = sPlayerRunScytheTest;
	
	//instance_create_depth(x, y, depth, oBonepile);
}


instance_create_depth(0,0,-99999,oWarpStart);