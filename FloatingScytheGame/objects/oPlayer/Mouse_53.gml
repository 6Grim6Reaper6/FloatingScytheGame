if (not split)
{
	if (attack == 0 or (attack == 1 and attackFrame == 1))
	{
		audio_play_sound(aAttack1, 1, false, 1, 0, random_range(0.7, 1.3));
		attack++;
		isAttacking = true;
		attackFrame = 10 - attack;
	}
}