if (triggered != (place_meeting(x, y, oPlayer) or place_meeting(x, y, oBonepile)))
{
	triggered = not triggered;
	image_index = triggered;
	audio_play_sound_on(emitter, aPressureplate, false, 0);

	with (oDoor)
	{
		if (other.myDoor == myPlate)
		{
			event_user(not other.triggered);
		}
	}

}
