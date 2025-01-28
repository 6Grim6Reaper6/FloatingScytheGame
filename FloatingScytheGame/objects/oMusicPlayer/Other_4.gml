function PlayMusic()
{
	if (currSong != -1) { audio_stop_sound(currSong); }
	switch (LastRoomTag)
	{
		case "Menu":
			currSong = aMenuMusic;
			break;
		case "Normal level":
			currSong = aNormalLevelMusic;
			break;
		case "Boss level":
			currSong = aBossMusic;
			break;
	}
	audio_play_sound(currSong, 0, true);
}
if (loaded)
{
	if (LastRoomTag == -1 and asset_has_any_tag(room, ["Menu", "Normal level", "Boss level"], asset_room))
	{
		LastRoomTag = asset_get_tags(room, asset_room)[0];
		PlayMusic();
	}
	else
	{
		if (LastRoomTag != asset_get_tags(room, asset_room)[0])
		{
			LastRoomTag = asset_get_tags(room, asset_room)[0];
			PlayMusic();
		}
	}
}


