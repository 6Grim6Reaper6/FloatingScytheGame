function gameInit()
{
	global.loadingRoom = false;
	global.paused = false;
	global.firstTime = false;
	global.lastRoom = MainMenu;
	global.firstTime = not file_exists("settings.txt");
	if (global.firstTime)
	{
		global.settings = {
			Music: 0,
			Ambient: 0,
			SFX: 0,
			fullscreen: false,
			borderless: true,
			toggleSprint: true,
			resW: 1920,
			resH: 1080,
		};
	}
	else 
	{ 
		var _buffer = buffer_load( "settings.txt");
		var _json = buffer_read( _buffer, buffer_string);
		buffer_delete( _buffer);
		
		global.settings = json_parse( _json);
	}
}
