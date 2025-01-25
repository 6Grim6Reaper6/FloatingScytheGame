function getHit(HitterX, HitterY)
{
	if (iFrames > 0) { return; }
	var vector = getVector(HitterX, HitterY);
	throw_x = -1 * vector[0];
	throw_y = -1.2 * vector[1];
	if (souls == 0 && death = false)
	{
		// implement game over
		instance_create_depth(x, y, depth, oDeath);
		death = true;
		
	}
	else
	{
		var soul;
		repeat (souls)
		{
			soul = instance_create_depth(x, y, depth, oSouls);
			soul.fading = soul.fadeTimer;
			souls--;
		}
				
		iFrames = 15;
	}
}

function getVector(targetX, targetY)
{
	targetX -= x;
	targetY -= y;
	var length = sqrt(targetX * targetX + targetY * targetY);
	return [targetX / length, targetY / length];
}

//control setup
controlsSetup();


// Combat
split = true;
throwTimer = 0;
isAttacking = false;
throw_x = 0;
throw_y = 0;
iFrames = 0;
souls = 1;
death = false;

//Sprites
maskSpr = sPlayerIdleScythe;
idleSpr = sPlayerIdleScythe;
walkSpr = sPlayerWalkScythe;
runSpr = sPlayerRunScytheTest;
slideSpr = sPlayeSlideScythe;
jumpSpr = sPlayerRunScytheTest;


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
jumpMax = 1;
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
GameStart = true;
