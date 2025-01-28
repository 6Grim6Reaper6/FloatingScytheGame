// Throw scythe
if (split)
{
	if (place_meeting(x, y, oBonepile))
	{
		audio_play_sound(choose(aPossession1, aPossession2, aPossession3), 1, false);
		split = false;
		jumpMax = 2;
		instance_destroy(instance_nearest(x, y, oBonepile));
	}
}
else
{
	audio_play_sound(choose(aThrow1, aThrow2, aThrow3), 1, false);
	onGround = false;
	isAttacking = true;
	var vector = getVector(mouse_x, mouse_y);
	throw_x = vector[0];
	throw_y = vector[1];
	split = true;
	jumpMax = 1;
	throwTimer = 15; 
	
	instance_create_depth(x, y, depth, oBonepile);
	hp = 80;
}