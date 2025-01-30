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
if (not instance_exists(oPlayer) and (room != Level1Part1)) { instance_create_layer(0, 0, "Instances", oPlayer); }
with (oPlayer)
{
	souls = global.lastPlayer._souls;
	split = global.lastPlayer._split;
	stamina = global.lastPlayer._stamina;
	hp = global.lastPlayer._hp;
	x = global.lastPlayer._x;	
	y = global.lastPlayer._y;
	jumpMax = global.lastPlayer._maxJump;
}

room_restart();
