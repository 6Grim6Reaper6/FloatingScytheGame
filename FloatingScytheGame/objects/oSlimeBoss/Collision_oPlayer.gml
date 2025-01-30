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
	}
}


