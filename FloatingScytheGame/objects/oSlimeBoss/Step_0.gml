audio_emitter_position(emitter, x, y, 0);

if (hp > 0)
{	
	// check distance to player, if too far then move randomly
	if (distance_to_object(oPlayer) < 200) { xDir = sign(oPlayer.x - x); }
	else { xDir = choose(-1, 1); }
	
	if (idle > 0 or isAttacking) { idle--; }
	else
	{
		xspd = 4;
		if (jumpStep == 0 and distance_to_object(oPlayer) < 400)
		{ 
			audio_play_sound_on(emitter, choose(aSlimeJump1, aSlimeJump2, aSlimeJump3), false, 0);
		}
		if ((jumpStep == 0 and onGround) or (jumpStep < (array_length(jumpSequance) * 2) and not onGround))
		{
			yspd = jumpSequance[jumpStep / 2];
			jumpStep++;
			onGround = false;
		}
		else
		{
			jumpStep = 0;
			idle = idleMax;
		}
	}

	if (iFrames > 0) { iFrames--; }
	
	if (not onGround) { yspd += grav;	}
	else { yspd = 0; }
	
	if (attackFrame > 0)
	{
		if (attackFrame == 1) { isAttacking = false; }
		attackFrame--;
		move_and_collide(0, yspd, oWall, 4, 0, 8);
	}
	else 
	{
		if (attackCD > 0 and attackFrame > 0) { attackCD--; }
		move_and_collide(xspd * xDir, yspd, oWall, 4, 0, 8);
		xspd = 0;
	}
		
	// if close to player do attack thing
	if (distance_to_object(oPlayer) < 20 and attackCD == 0)
	{ 
		isAttacking = true;
		attackFrame = 20;
		attackCD = 20;
		audio_play_sound_on(emitter, choose(aSlimeJump1, aSlimeJump2, aSlimeJump3), false, 0);
	}
	onGround = (place_meeting(x, y + 4, oWall));	
}
else
{
	instance_destroy();
	if (size > 1)
	{
		size--;
		var _SlimeChild = instance_create_layer(x + 20, y - 5, "Instances", oSlimeBoss);
		_SlimeChild.DownSize(size);
		_SlimeChild = instance_create_layer(x - 20, y - 5, "Instances", oSlimeBoss);
		_SlimeChild.DownSize(size);
	}
}

