clicked = true;
audio_play_sound(aButtonSound, 1, false);
if (global.settings.Music == 0) { global.settings.Music = 100; }
else { global.settings.Music -= 10 };
audio_group_set_gain(agAmbient, global.settings.Music / 100, 0);