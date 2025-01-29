// Inherit the parent event
event_inherited();
with(oPause)
{
	if (pause)
	{  
		event_user(0);
	} 
}

with (oMusicPlayer)
{
	LastRoomTag = -1;
}

with (oPlayer)
{
	souls = lastSouls;
	split = lastSplit;
	stamina = lastStamina;
	hp = lastHP;
	x = lastX;	
	y = lastY;
}

room_restart();
