// Inherit the parent event
event_inherited();
if (global.settings.Ambient == 100) { global.settings.Ambient = 0; }
else { global.settings.Ambient += 10 };
