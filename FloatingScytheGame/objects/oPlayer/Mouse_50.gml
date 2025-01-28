if (not split)
{
	if (onWall != -1 and onWall != 1 and stamina >= 0)
	{
		if (attack == 0 or (attack == 1 and attackFrame == 1))
		{
			audio_play_sound(aAttack1, 1, false, 1, 0, random_range(0.7, 1.3));
			attack++;
			isAttacking = true;
			attackFrame = 14 - attack;
			if (face = -1)
				{
					xspd -= moveSpd[runType];
					xDir = -1;
				}else
				{
					xspd += moveSpd[runType];
					xDir = 1;
				}
		}
	}
}

