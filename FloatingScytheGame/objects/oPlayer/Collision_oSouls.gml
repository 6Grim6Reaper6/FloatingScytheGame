if (not other.collected and iFrames == 0)
{
	souls++;
	other.sprite_index = sSoulsCollected;
	other.collected = true;
	if (not audio_is_playing(aSoulCollect)) { audio_play_sound(aSoulCollect, 0, false); }
}