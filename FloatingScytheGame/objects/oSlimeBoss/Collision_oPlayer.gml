if (iFrames == 0)
{
	if (isAttacking or (not other.isAttacking))
	{
		other.getHit(x, y, 50);
	}
	else
	{
		hp--;
		iFrames = 20;
		var vector = other.getVector(x, y);
		knockbackX = -1 * vector[0];
		knockbackY = -1.2 * vector[1];
	}
}


