if instance_exists(oPlayer)
{
	x = oPlayer.x+17;
	y = oPlayer.y-32;
	instance_destroy(oPlayer);
	//instance_deactivate_object(oPlayer);
}
depth = 150;
if instance_exists(oText)
{
	instance_destroy(oText);
}
audio_stop_all();
audio_play_sound(aDeathSound, 0, false);