//Sprite Control
//Walking
face = xDir;
if (abs(xspd) > 0) {sprite_index = walkSpr;};
//Running
if (abs(xspd) >= moveSpd[1]) {sprite_index = runSpr;};
//not moving
if xspd == 0 {sprite_index = idleSpr;};
//In the air
if (not onGround)
{
	if (onWall != 0)
	{
		if (not split) { face *= -1; }
		sprite_index = slideSpr;
	}
	else{
	sprite_index = jumpSpr;
	}
		
}
//set the collision mask
mask_index = maskSpr;


//Get Inputs
getControls();
if (iFrames > 0) { iFrames--; }

if (throwTimer > 0)
{ 
	xspd = xDir * throwTimer;
	throwTimer--;	
}

if (wallBoost > 0)
{ 
	xspd += -1 * xDir * moveSpd[0];
	wallBoost--;
}

onWall = xDir * (place_meeting(x + ( xDir * 4), y - 4, oWall)); // is attached to wall
if (place_meeting(x, y - 8, oWall))
{
	onWall = 0;
	jumpHoldTimer = 0;
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


move_and_collide(xspd, yspd, oWall, 8, 0, maxStepAssist, 999999, 999999);
xspd = 0;

// Check if on ground
onGround = (place_meeting(x, y + 2, oWall));



//Y Collsion and movement
//Cap falling speed

/*
var _subPixel = .5;
if (throwTimer > 0){ throwTimer--; } // Tick down
if (jumpHoldTimer > 0) 
{
}

if (not onGround) {yspd += grav;}
// Collide with ground
if (place_meeting(x, y + yspd, oWall) and yspd != 0)
{
	yspd = 0;
	while(!place_meeting(x, y + yspd, oWall)) { yspd += yDir * _subPixel}; // inc closer to ground
	if (yDir > 0) 
	{
		//yDir = 0;
		setOnGround(true);
	}
}

// Check falling 
if (not place_meeting(x, y + 1, oWall) and onGround)
{
	setOnGround(false);
}

if (place_meeting(x + xspd, y + 1, oWall) and xspd != 0)
{
	if (not onGround)
	{
		while(!place_meeting(x + xspd, y, oWall)) { xspd += xDir * _subPixel};
		onWall = xDir;
	}
	else 
	{
		if (!place_meeting(x + xspd, y + maxStepAssist, oWall))
		{
			yspd += maxStepAssist;
		}
		else 
		{ 
			xspd = 0;
			while(!place_meeting(x + xspd, y, oWall)) { xspd += xDir * _subPixel};
		} // inch closer to wall
	}
}

/*
var onWall = place_meeting(x-4,y-1,oWall) - place_meeting(x+4,y-1,oWall); // is attached to wall
mvlocked = max(mvlocked -1, 0);
// X Movement
	if mvlocked <= 0 {
	//Direction
	xDir = rightKey - leftKey;
	//Get my face
	if xDir != 0 {face = xDir;};
	
	//Get xspd
	xspd = xDir * moveSpd[runType];
	if (throwTimer > 0) { xspd = face * throwTimer; }
}
	if (onWall !=0 and not split) {
		jumpCount = 1;
		yspd *= 0.5;
		if mvlocked <= 0 {
			if (jumpKeyPressed)
				{
					yspd = -10
					if !place_meeting(x,y-8,oWall){
						xspd = onWall * moveSpd[0];
					}
					mvlocked = 14;
				}
			}
		}
	
//X Collsion
var _subPixel = .5;
if place_meeting( x + xspd, y, oWall)
	{
		//First check if there is a slope to go up
		if !place_meeting(x + xspd, y - abs(xspd)-1, oWall)
		{
			while place_meeting(x + xspd, y, oWall) {y -= _subPixel;};
		}
		//Next, check for ceiling slopes, otherwise, do a regualar collision
		else
		{
			//Ceiling Slopes
			if !place_meeting(x + xspd, y + abs(xspd)+1, oWall)
			{
				while place_meeting(x + xspd, y, oWall) {y += _subPixel;};
			}
			//Normal Collision
			else 
			{
				//Scoot up to wall
				face = onWall;
					
				var _pixelCheck = _subPixel * sign(xspd);
				while !place_meeting(x + _pixelCheck, y, oWall) {x += _pixelCheck;};
				//Set xspd to zero to "collide"
				xspd = 0;
					
			}
		}
	}
		
	//Go down the Slopes
	if yspd >= 0 && !place_meeting( x + xspd, y + 1, oWall) && place_meeting( x + xspd, y +  abs(xspd)+1, oWall)
	{
		while !place_meeting(x + xspd, y + _subPixel, oWall) {y += _subPixel;};
	}


	
//Y Movement
//Gravity
if coytoeHangTimer > 0
{
	//Count the timer down
	coytoeHangTimer--;
}else {
	//Apply gravity to the player
	yspd += grav;
	//We're no longer on the ground
	setOnGround(false);
}
//Reset/Perpare jumping variables
if onGround
{
	jumpCount = 0;
	coyoteJumpTimer = coyoteJumpFrames;
	//jumpHoldTimer = 0;
} else {
	//if the player is in the air, make sure they can't do an extra jump
	coyoteJumpTimer--;
	if (jumpCount == 0 && coyoteJumpTimer <= 0) { jumpCount = 1;};
}
	
//Initiate the Jump
if jumpKeyBuffered && jumpCount < jumpMax
{
	//reset the buffer
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
		
	//Increase the number of perfomred jumps
	jumpCount++;
	//Set the jump hold timer
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
	//Tell ourself we're no longer on the ground
	setOnGround(false);
}
	
//Jump based on the timer/holding the button
if jumpHoldTimer > 0
{
	//Constantly set the yspd to be jumping speed
	yspd = jspd[jumpCount-1];
	//Countdown the timer
	jumpHoldTimer--;
}
//Cut off the jump by releasing the jump button
if !jumpKey
{
	jumpHoldTimer = 0;
}
//Y Collsion and movement
	//Cap falling speed
if yspd > termVel {yspd = termVel;};
	
//Y Collsion
var _subPixel = .5;
	
//Upwards Y Collsion (with ceiling slopes)
if yspd < 0 && place_meeting(x ,y + yspd, oWall)
{
	//Jump into sloped ceilings
	var _slopeSlide = false;
		
	//Slide Upleft slope
	if xDir == 0 && !place_meeting( x - abs(yspd)-1, y + yspd, oWall)
	{
		while place_meeting(x, y + yspd, oWall) {x -= 1;};
		_slopeSlide = true;
	}
	//Slide UpRight slope
	if xDir == 0 && !place_meeting( x + abs(yspd)+1, y + yspd, oWall)
	{
		while place_meeting(x, y + yspd, oWall) {x += 1;};
		_slopeSlide = true;
	}
		
	//Normal Y collsion
	if !_slopeSlide
	{
		//Scoot up to the wall
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting( x , y+_pixelCheck, oWall)
		{
			y += _pixelCheck;
		}
		//Bonk Code [Optional]
		if yspd < 0 { jumpHoldTimer = 0;};
		//Set yspd to 0 to collide
		yspd = 0;
	}
}
//Downwards Y Collsion
if yspd >= 0
{
	if place_meeting(x ,y + yspd, oWall)
	{
		//Scoot up to the wall
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting( x , y+_pixelCheck, oWall)
		{
			y += _pixelCheck;
		}
		//Bonk Code [Optional]
		//if yspd < 0 { jumpHoldTimer = 0;};
		//Set yspd to 0 to collide
		yspd = 0;
	}
	//Set if I'm on the ground
	if place_meeting(x , y+1, oWall)
	{
		setOnGround(true);
	}
}
//Move
*/
	





/*
//Move
x += xspd;
y += yspd;
xspd = 0;
if (onGround) { yspd = 0; }*/

