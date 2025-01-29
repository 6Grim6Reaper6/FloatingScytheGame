if (iFrames == 0)
{
	if (isAttacking or not other.isAttacking)
	{
		other.getHit(x, y, 50);
	}
	else
	{
		hp--;
		iFrames = 20;
		audio_play_sound_on(emitter, aDoor, false, 0);
	}
}


