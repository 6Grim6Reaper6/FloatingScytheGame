if (not other.collected and iFrames == 0)
{
	souls++;
	other.sprite_index = sSoulsCollected;
	other.collected = true;
	audio_play_sound(aSoulCollect, 0, false);
}