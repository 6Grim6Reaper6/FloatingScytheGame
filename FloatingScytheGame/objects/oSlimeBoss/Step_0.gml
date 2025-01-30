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
			audio_play_sound_on(emitter, choose(aSlimeBossJump1, aSlimeBossJump2), false, 0, 1, 0, pitch);
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
		if (iFrames < 10)
		{
			move_and_collide(xspd * xDir, yspd, oWall, 4, 0, 8);
			xspd = 0;
		}
		else
		{
			move_and_collide(knockbackX * -5, knockbackY * -5, oWall, 4, 0, 8);
		}
	}
		
	// if close to player do attack thing
	if (distance_to_object(oPlayer) < 20 and attackCD == 0)
	{ 
		isAttacking = true;
		attackFrame = 20;
		attackCD = 20;
		audio_play_sound_on(emitter, choose(aSlimeBossAttack1, aSlimeBossAttack2), false, 0, 1, 0, pitch);
	}
	onGround = (place_meeting(x, y + 4, oWall));	
}
else
{
	instance_destroy();
	audio_play_sound_on(emitter, aSlimeBossDeath, false, 0, 1, 0, pitch);
	if (size > 1)
	{
		size--;
		var c1;
		var c2;
		switch (color)
		{
			case(#FFFFFF): // White
				c1 = choose(#FF0000, #00FF00, #0000FF); // Randomise Red Green and Blue
				c2 = #FFFFFF - c1; // Become the anti of chosen color
				break;
				
			case #FF0000: // Red → Anti-Blue (Yellow) & Anti-Green (Magenta)
		        c1 = #FFFF00; // Yellow
		        c2 = #FF00FF; // Magenta
		        break;
        
		    case #00FF00: // Green → Anti-Red (Cyan) & Anti-Blue (Magenta)
		        c1 = #00FFFF; // Cyan
		        c2 = #FF00FF; // Magenta
		        break;
        
		    case #0000FF: // Blue → Anti-Red (Cyan) & Anti-Green (Yellow)
		        c1 = #00FFFF; // Cyan
		        c2 = #FFFF00; // Yellow
		        break;
        
		    case #00FFFF: // Cyan → Green & Blue
		        c1 = #00FF00; // Green
		        c2 = #0000FF; // Blue
		        break;
        
		    case #FF00FF: // Magenta → Red & Blue
		        c1 = #FF0000; // Red
		        c2 = #0000FF; // Blue
		        break;
        
		    case #FFFF00: // Yellow → Red & Green
		        c1 = #FF0000; // Red
		        c2 = #00FF00; // Green
		        break;	
		}
		
		var _SlimeChild = instance_create_layer(x + 20, y - 5, "Instances", oSlimeBoss);
		_SlimeChild.DownSize(size);
		_SlimeChild.color = c1;
		_SlimeChild = instance_create_layer(x - 20, y - 5, "Instances", oSlimeBoss);
		_SlimeChild.DownSize(size);
		_SlimeChild.color = c2;
	}
}

