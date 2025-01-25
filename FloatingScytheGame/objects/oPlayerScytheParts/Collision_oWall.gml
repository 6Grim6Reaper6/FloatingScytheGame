
if vspeed > 1
{
	vspeed *= -0.5;
}
else
{
	vspeed = 0;
	while !place_meeting(x,y,oWall)
	{
		y++;
	}
	gravity = 0;
	friction = 1;
}