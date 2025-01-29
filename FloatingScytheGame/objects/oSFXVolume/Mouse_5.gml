clicked = true;
audio_play_sound(aButtonSound, 1, false);
if (global.settings.SFX == 0) { global.settings.SFX = 100; }
else { global.settings.SFX -= 10 };
audio_group_set_gain(agAmbient, global.settings.SFX / 100, 0);