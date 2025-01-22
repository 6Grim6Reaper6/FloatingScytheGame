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
	throw_x = mouse_x - x;
	throw_y = mouse_y - y;
	var length = sqrt(throw_x * throw_x + throw_y * throw_y);
	throw_x /= length;
	throw_y /= length;
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