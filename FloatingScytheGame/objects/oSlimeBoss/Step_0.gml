audio_emitter_position(emitter, x, y, 0);

if (hp > 0)
{
	if iFrames > 0
	{
		image_alpha = ((iFrames % 10 ) * 0.1);
		iFrames--;
	}
	else 
	{
		image_alpha = 1;
	}
	
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

	if (not onGround)
	{ 
		yspd += grav;
		sprite_index = sSlimeJumpBoss;
	}
	else
	{ 
		yspd = 0;
		sprite_index = sSlimeIdleBoss;
	}
	
	attacking = distance_to_object(oPlayer) < 20;
	if (attacking) { sprite_index = sSlimeAttackBoss; audio_play_sound_on(emitter, choose(aSlimeJump1, aSlimeJump2, aSlimeJump3), false, 0);}
	else{
	move_and_collide(xspd * xDir, yspd, oWall, 4, 0, 8);
	}
	xspd = 0;
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

