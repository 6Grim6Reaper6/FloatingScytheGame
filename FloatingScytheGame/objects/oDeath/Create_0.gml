if instance_exists(oPlayer)
{
	x = oPlayer.x+17;
	y = oPlayer.y-32;
	instance_destroy(oPlayer);
}
depth = 150;
if instance_exists(oText)
{
	instance_destroy(oText);
}