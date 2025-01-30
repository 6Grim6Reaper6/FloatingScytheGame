if (not global.buttonClicked)
{
	if (onWall == 0)
	{
		if (not split)
		{
			if (stamina >= attackStaminaCost)
			{
				if (attack == 0 or (attack == 1 and attackFrame == 1))
				{
					audio_play_sound(aAttack1, 1, false, 1, 0, random_range(0.7, 1.3));
					attack++;
					stamina = clamp(stamina - attackStaminaCost, 0, stamina_max);
					isAttacking = true;
					attackFrame = 24 - (8 * attack);
					//xspd += xDir * moveSpd[runType];
				}
			}
		}
		else
		{
			attackCharging = true;
			isAttacking = true;
			if (not audio_is_playing(aSpin1) and not audio_is_playing(aSpin2))
			{
				audio_play_sound(choose(aSpin1, aSpin2), 0, false);
			}
			
			if (attackCharge < 30)
			{
				attackCharge++;
			}
			else
			{
				mouse_clear(mb_left);
			}
		}
	}
}

