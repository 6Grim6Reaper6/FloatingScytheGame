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
if (iFrames > 0)// Tick down iFrames
{ 
	xspd = throw_x * 5;
	yspd = throw_y * 5;
	iFrames--;

} 

// Handle throwing
if (throwTimer > 0)
{ 
	isAttacking = true;
	xspd = throw_x * throwTimer;
	yspd = throw_y * throwTimer;
	throwTimer--;	
}
else
{
	isAttacking = false;
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
xspd = 0;

// Sets audio reciver to player location
audio_listener_position(x, y , 0);

// Check if on ground
onGround = (place_meeting(x, y + 2, oWall));



var front = layer_get_id("Background_Cam");
var near = layer_get_id("Background_Near");
var far = layer_get_id("Background_Far");

layer_x(front, lerp(0, camera_get_view_x(view_camera[0]), 1));
layer_y(front, lerp(0, camera_get_view_y(view_camera[0]), 1));
layer_x(near, lerp(0, camera_get_view_x(view_camera[0]), 0.4));
layer_x(far, lerp(0, camera_get_view_x(view_camera[0]), 0.6));
//layer_y(far, lerp(0, camera_get_view_y(view_camera[0]), 0.2));