if distance_to_object(oPlayer) < 20
{
	if image_alpha != 1
	{
	image_alpha += .01;
	alpha += .01;
	}
}else
{
	if image_alpha != 0
	{
	image_alpha -=.01;
	alpha -= .01;
	}
}

if not (permenant)
{
	visible = distance_to_object(oPlayer) < 200;
}
if (visible)
{
	image_index = clicked;
	
}