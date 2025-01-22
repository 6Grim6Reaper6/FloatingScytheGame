function controlsSetup()
{
	bufferTime = 3;
	
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}

function getControls()
{
	//Directions Inputs
	rightKey = keyboard_check(ord("D")) + keyboard_check(vk_right);
		rightKey = clamp(rightKey, 0, 1);
	leftKey = keyboard_check(ord("A")) + keyboard_check(vk_left);
		leftKey = clamp(leftKey, 0, 1);
	
	//Action inputs
	jumpKeyPressed = keyboard_check_pressed(vk_space);
		jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
	jumpKey = keyboard_check(vk_space);
		jumpKey = clamp(jumpKey, 0, 1);
		
		runKey = keyboard_check(vk_shift);
		runKey = clamp(runKey, 0, 1);
		
	throwKey = keyboard_check_pressed(ord("E"));
		throwKey = clamp(throwKey, 0, 1);
		
	gettingHit = mouse_check_button_pressed(mb_left);
	// Jump key buffering
	if jumpKeyPressed
	{
		jumpKeyBufferTimer = bufferTime;
	}
	if jumpKeyBufferTimer > 0
	{
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	}else{
		jumpKeyBuffered = 0;
	}
	
}