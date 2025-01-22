// Throw scythe
if (split)
{
	if (place_meeting(x, y, oBonepile) and throwTimer == 0)
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
	split = true;
	jumpMax = 1;
	throwTimer = 15; 
	
	//Change sprites
	maskSpr = sPlayerIdleScythe;
	idleSpr = sPlayerIdleScythe;
	walkSpr = sPlayerWalkScythe;
	runSpr = sPlayerRunScytheTest;
	slideSpr = sPlayeSlideScythe;
	jumpSpr = sPlayerRunScytheTest;
	
	instance_create_depth(x, y, depth, oBonepile);
}