// Inherit the parent event
event_inherited();
global.settings.fullscreen = not global.settings.fullscreen;
window_set_fullscreen(global.settings.fullscreen);

