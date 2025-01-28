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

var _souls = 0;
var _split = 0;

with (oPlayer)
{
	_souls = lastSouls;
	_split = lastSplit;
	persistent = false;
}

instance_destroy(oPlayer);

room_restart();

with (oPlayer)
{
	souls = _souls;
	lastSouls = _souls;
	split = _split;
	lastSplit = _split;
	persistent = true;
}



