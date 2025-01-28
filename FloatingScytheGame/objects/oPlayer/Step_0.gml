
//Get Inputs
getControls();
if (iFrames > 0)// Tick down iFrames
{ 
	xspd = throw_x * 5;
	yspd = throw_y * 5;
	iFrames--;

} 

if (attackCharge > 0 and not attackCharging)
{
	xspd = xDir * 15;
	
	if (attackCharge == 1) { isAttacking = false;}
	attackCharge--;
}

if (attackFrame > 0)
{
	if (attackFrame == 1) { isAttacking = false; attack = 0;}
	attackFrame--;
	stamina--;
}else{
	if (stamina != 40)
	{
	stamina += .5;
	}
}


// Handle throwing
if (throwTimer > 0)
{ 
	xspd = throw_x * throwTimer;
	yspd = throw_y * throwTimer;
	if (throwTimer == 1) { isAttacking = false; }
	throwTimer--;
}

if (wallBoost > 0)
{ 
	xspd += -1 * xDir * moveSpd[1];
	wallBoost--;
}

onWall = xDir * (place_meeting(x + ( xDir * 4), y - 4, oWall)); // is attached to wall
if (place_meeting(x, y - 8, oWall))
{
	onWall = 0;
	jumpHoldTimer = 0;
	yspd = jspd[0];
}

if (onWall != 0 and wallBoost <= 0)
{
	yspd *= 0.5;
	
	if (split) { yspd = 0; }
	jumpCount = 0;
}

if (onGround)
{
	yspd = 0;
	jumpCount = 0;
	wallBoost = 0
	coyoteJumpTimer = (not split) * coyoteJumpFrames;
	coytoeHangTimer = coyoteHangFrames;
	
}
else
{
	coyoteJumpTimer--;
	coytoeHangTimer--;
	if (jumpHoldTimer > 0)
	{
		yspd = jspd[jumpCount];
		jumpHoldTimer--;
	}
	else
	{
		if (coytoeHangTimer <= 0)
		{
			yspd += jspd[0];
		}
	}
}

if (onWall != 0 and wallBoost <= 0)
{
	yspd *= 0.5;
	if (split) { yspd = 0; }
	jumpCount = 0;
}

// Moves and makes sure not to hit wall
move_and_collide(xspd, yspd, oWall, 8, 0, maxStepAssist, 999999, 999999);


// Sets audio reciver to player location
audio_listener_position(x, y , 0);

// Check if on ground
onGround = (place_meeting(x, y + 2, oWall));

if (stamina <= 0 and runType = true) {runType = false;};

