//Custom functions for player
function setOnGround(_val = true)
{
	if _val == true
	{
		onGround = true;
		coytoeHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		coytoeHangTimer = 0;
	}
}
//control setup
controlsSetup();

//Sprites
maskSpr = sPlayerIdle;
idleSpr = sPlayerIdle;
walkSpr = sPlayerWalk;
runSpr = sPlayerRunTest;
slideSpr = sPlayeSlide;
jumpSpr = sPlayerJump;

//Wall Jumping
wall_jump_vert_speed = -5;
wall_jump_horz_speed = 5;
can_wall_jump = false;
wall_jump_forgiveness = 5;
mvlocked = 0;


//Moving
face = 1;
moveDir = 0;
runType = 0;
moveSpd[0] = 2;
moveSpd[1] = 4.5;
xspd = 0;
yspd = 0;

//Collectables
souls = 0;
//Combat
split = false;
throwTimer = 0;
beingHitTimer = 0;
//Jumping
	grav = .275;
	termVel = 4;
	onGround = true;
	jumpMax = 2;
	jumpCount = 0;
	jumpHoldTimer = 0;
		//Jump values for each successive jump
		jumpHoldFrames[0] = 18;
		jspd[0] = -3.15;
		jumpHoldFrames[1] = 10;
		jspd[1] = -2.85;


	//Coyote Time
	//Hang time
	coyoteHangFrames = 2;
	coytoeHangTimer = 0;
	//Jump buffer time
	coyoteJumpFrames = 4;
	coyoteJumpTimer = 0;