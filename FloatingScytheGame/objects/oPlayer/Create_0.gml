function getHit(HitterX, HitterY, damage)
{
	if (iFrames > 0) { return; }
	audio_play_sound(choose(aPlayerHit1, aPlayerHit2, aPlayerHit3, aPlayerHit4), 0, false);
	var vector = getVector(HitterX, HitterY);
	throw_x = -1 * vector[0];
	throw_y = -1.2 * vector[1];
	
	if (souls == 0 && death == false)
	{
		// implement game over
		instance_create_depth(x, y, depth, oDeath);
		death = true;
	}
	else
	{
		iFrames = 20;
		if (split)
		{
			var soul;
			repeat (souls)
			{
				soul = instance_create_layer(x, y, "Instances", oSouls);
				soul.fading = soul.fadeTimer;
				souls--;
			}
		}
		else
		{
			hp -= damage;
		}
		if (hp == 0 or hp < 0)
		{
			if (not split)
			{
				audio_play_sound(choose(aThrow1, aThrow2, aThrow3), 1, false);
				onGround = false;
				split = true;
				jumpMax = 1;				
				//instance_create_depth(x, y, depth, oBonepile);
			}
			hp = hp_max;
		}
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



// variables for room restart
lastSouls = 0;
lastSplit = true;
lastX = x;
lastY = y;
lastHP = 0;
lastStamina = 0;


// Combat
attackCharging = false;
attackCharge = 0;
split = true;
throwTimer = 0;
isAttacking = false;
throw_x = 0;
throw_y = 0;
iFrames = 0;
souls = 1;
death = false;
attackFrame = 0;
attack = 0;
attackStaminaCost = 40;
stamina_max = 200;
stamina = stamina_max;
hp_max = 100;
hp = hp_max;


staminabar_width = 50;
staminabar_height = 6;
staminabar_x = (oPlayer.x + 50) - (staminabar_width / 2);
staminabar_y = (oPlayer.y + 50)

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
runType = true;
moveSpd[0] = 3; // Mormal speed
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

audio_listener_orientation(0, 1, 0, 0, 0, 1);
