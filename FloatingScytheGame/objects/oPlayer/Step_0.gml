//Get Inputs

getControls();
var onAwWall = place_meeting(x-4,y-4,oWall) - place_meeting(x+4,y-4,oWall);
mvlocked = max(mvlocked -1,0);
// X Movement
	if mvlocked <= 0 {
	//Direction
	moveDir = rightKey - leftKey;
	//Get my face
	if moveDir != 0 {face = moveDir;};
	
	//Get xspd
	runType = runKey;
	xspd = moveDir * moveSpd[runType];
	if (throwTimer > 0) {xspd = face * throwTimer;};
}
	if (onAwWall !=0 and not split) {
						jumpCount = 1;
						yspd *= 0.5;
						
						if mvlocked <= 0 {
							if (jumpKeyPressed)
								{
									yspd = -10;
								if !place_meeting(x,y-8,oWall){
								xspd = onAwWall * moveSpd[1];
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
					face = onAwWall;
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

	//Move
	x += xspd;
	
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
		if jumpCount == 0 && coyoteJumpTimer <= 0 { jumpCount = 1;};
		if split == true { jumpMax = 1;}else{jumpMax = 2;};
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
		if moveDir == 0 && !place_meeting( x - abs(yspd)-1, y + yspd, oWall)
		{
			while place_meeting(x, y + yspd, oWall) {x -= 1;};
			_slopeSlide = true;
		}
		//Slide UpRight slope
		if moveDir == 0 && !place_meeting( x + abs(yspd)+1, y + yspd, oWall)
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
	y += yspd;
	
	if (gettingHit){
		repeat (souls)
		{
			instance_create_depth(x,y,depth,oSouls);
			souls--;
		}
		if instance_exists(oSouls)
		{
			oSouls.hit = true;
		}
		beingHitTimer = 25;
	}
	if (beingHitTimer > 0)
	{
		beingHitTimer--;
	}
	
	if (beingHitTimer = 0)
	{
		if instance_exists(oSouls)
		{
			oSouls.hit = false;
		}
	}
	
	
	//Throw Scythe
	if (throwKey and not split){
		split = true;
		throwTimer = 15;
		
		instance_create_depth(x,y,depth,oBonepile);
	}
	if (throwTimer > 0)
	{
		throwTimer--;
	}
if split = false{
//Sprites
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRunTest;
slideSpr = sPlayeSlide;
jumpSpr = sPlayerJump;
}else{
//Sprites
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdleScythe;
walkSpr = sPlayerWalkScythe;
runSpr = sPlayerRunScytheTest;
slideSpr = sPlayeSlideScythe;
jumpSpr = sPlayerRunScytheTest;
}
//Sprite Control
	//Walking
	if abs(xspd) > 0 {sprite_index = walkSpr;};
	//Running
	if abs(xspd) >= moveSpd[1] {sprite_index = runSpr;};
	//not moving
	if xspd == 0 {sprite_index = idleSpr;};
	//In the air
	if !onGround {
		if (onAwWall != 0) {
		sprite_index = slideSpr;
		}
		else{
		sprite_index = jumpSpr;
		}
		
		}
		//set the collision mask
		mask_index = maskSpr;