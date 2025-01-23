if (jumpCount < jumpMax)
{
	if (onWall != 0)
	{
		if (not split)
		{
			wallBoost = 14; // Gain boost away from wall
		}
		onWall = 0;
	}
	//Increase the number of perfomred jumps
	jumpCount++;
	//Set the jump hold timer
	jumpHoldTimer = jumpHoldFrames[jumpCount - 1];
	//Tell ourself we're no longer on the ground
	onGround = false;
}