function gameInit()
{
	global.buttonClicked = false;
	global.loadingRoom = false;
	global.paused = false;
	global.firstTime = false;
	global.lastRoom = MainMenu;
	global.lastPlayer = {
		_x: 0,
		_y: 0,
		_souls: 0,
		_split: false,
		_hp: 0,
		_stamina: 0,
		_maxJump: 0
	};
	// since no saves gonna pretend player has played before
	//global.firstTime = not file_exists("settings.txt");
	global.settings = {
			Music: 50,
			Ambient: 50,
			SFX: 50,
			//fullscreen: false,
			//borderless: true,
			toggleSprint: true,
			resW: 1920,
			resH: 1080,
		};
		
	//window_enable_borderless_fullscreen(global.settings.borderless);
	//window_set_fullscreen(global.settings.fullscreen);
	window_set_size(global.settings.resW, global.settings.resH);
	
	audio_group_load(agMusic);
	audio_group_load(agAmbient);
	audio_group_load(agSFX);
		
	audio_group_set_gain(agMusic, global.settings.Music / 100, 0);
	audio_group_set_gain(agAmbient, global.settings.Ambient / 100, 0);
	audio_group_set_gain(agSFX, global.settings.SFX / 100, 0);	
	
		
	/*	
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
	}*/
}
