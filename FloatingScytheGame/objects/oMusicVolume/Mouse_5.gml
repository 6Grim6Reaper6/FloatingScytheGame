// Inherit the parent event
event_inherited();
if (global.settings.Music == 0) { global.settings.Music = 100; }
else { global.settings.Music -= 10 };
audio_group_set_gain(agMusic, global.settings.Music / 100, 0);