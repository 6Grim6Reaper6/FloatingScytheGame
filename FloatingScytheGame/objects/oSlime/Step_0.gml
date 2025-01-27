audio_emitter_position(emitter, x, y, 0);

if (not hit)
{
	// check distance to player, if too far then move randomly
	aggro = distance_to_object(oPlayer) < 200;
	if (aggro) { xDir = sign(oPlayer.x - x); }
	else { xDir = choose(-1, 1); }
	if (idle > 0) { idle--; }
	else
	{
		xspd = 4;
		if (jumpStep == 0 and distance_to_object(oPlayer) < 400)
		{ 
			audio_play_sound_on(emitter, aSlimeJump, false, 0);
			//audio_play_sound_at(aSlimeJump, x, y, 0, 400, 400, 1, false, 0, audio_group_get_gain(agSFX), 0, random_range(0.8, 1.2));
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

	if (not onGround)
	{ 
		yspd += grav;
		sprite_index = sSlimeJump;
	}
	else
	{ 
		yspd = 0;
		sprite_index = sSlimeIdle;
	}
	move_and_collide(xspd * xDir, yspd, oWall, 4, 0, 8);
	xspd = 0;
	onGround = (place_meeting(x, y + 4, oWall));
}
else
{
	//sprite_index = sSlimeDeath;
	

	instance_destroy();


}

