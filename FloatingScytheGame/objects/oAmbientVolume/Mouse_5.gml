clicked = true;
audio_play_sound(aButtonSound, 1, false);
if (global.settings.Ambient == 0) { global.settings.Ambient = 100; }
else { global.settings.Ambient -= 10 };
audio_group_set_gain(agAmbient, global.settings.Ambient / 100, 0);