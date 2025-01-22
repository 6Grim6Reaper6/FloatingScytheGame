function getHit()
{
	if (souls == 0)
	{
		// implement game over
	}
	else
	{
		repeat (souls)
		{
			instance_create_depth(x, y, depth, oSouls);
			souls--;
		}
		iFrames = 25;
	}
}


//control setup
controlsSetup();


// Combat
split = false;
throwTimer = 0;
souls = 0;
iFrames = 0;


//Sprites
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRunTest;
slideSpr = sPlayeSlide;
jumpSpr = sPlayerJump;


//Moving
face = 1;
xDir = 1;
yDir = 1;
onWall = 0;
runType = false;
moveSpd[0] = 2; // Mormal speed
moveSpd[1] = 4.5; // Sprint speed
xspd = 0;
yspd = 0;
maxStepAssist = -2;


//Jumping
termVel = 4;
onGround = false;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
wallBoost = 0;

//Jump values for each successive jump
jumpHoldFrames[0] = 18;
jumpHoldFrames[1] = 10;
jspd[0] = .275; // Not jumping
jspd[1] = -3.15;
jspd[2] = -2.85;


//Coyote Time
//Hang time
coyoteHangFrames = 2;
coytoeHangTimer = 0;
//Jump buffer time
coyoteJumpFrames = 4;
coyoteJumpTimer = 0;