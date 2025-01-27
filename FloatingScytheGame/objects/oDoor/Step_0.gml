finished = (open and image_index >= image_number - 1) or (not open and image_index <= 0);

// 8 or -8 image fps to open or close
image_speed = (not finished) * ((open * 16) - 8);

if (finished)
{
	if (open)
	{
		mask_index = sNotADoor;
	}
	else
	{
		mask_index = sDoor;
	}
}



