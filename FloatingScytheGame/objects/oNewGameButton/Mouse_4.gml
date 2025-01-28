// Inherit the parent event
event_inherited();
with(oPause)
{
	if (pause)
	{  
		event_user(0);
	} 
}
instance_destroy(oPlayer);
with (oMusicPlayer)
{
	LastRoomTag = -1;
}
room_goto(Level1Part1);
