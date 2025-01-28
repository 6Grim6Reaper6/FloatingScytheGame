if (not loaded)
{
	loaded = audio_group_is_loaded(agMusic);
	if (loaded and currSong = -1)
	{
		event_perform(ev_other, ev_room_start);
	}
}