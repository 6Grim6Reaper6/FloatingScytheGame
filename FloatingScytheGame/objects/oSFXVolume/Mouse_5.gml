// Inherit the parent event
event_inherited();
if (global.settings.SFX == 0) { global.settings.SFX = 100; }
else { global.settings.SFX -= 10 };
audio_group_set_gain(agSFX, global.settings.SFX / 100, 0);