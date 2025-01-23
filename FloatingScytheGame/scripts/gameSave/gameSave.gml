global.game_data = 
{
	room_data: {}	
};

function loadStruct(ID, data)
{
	var keys = variable_struct_get_names(data);
	for (var i = 0; i < array_length(keys); i++)
	{
		variable_instance_set(ID, keys[i], variable_struct_get(data, keys[i]));
	}
}

function save_game()
{
	
	save_room();
	
	var _string = json_stringify( global.game_data);
	
	var _buffer = buffer_create( string_byte_length( _string) + 1, buffer_fixed, 1);

	buffer_write( _buffer, buffer_string, _string);

	buffer_save( _buffer, "save.txt");

	buffer_delete( _buffer);
	
}

function save_room()
{
	var _array = [];
	
	with(oSouls)
	{
		var _struct = 
		{
			object: object_get_name( object_index),
			x: x,
			y: y,
			image_index: image_index,
			dx: dx,
			dy: dy,
			collected: collected
		}
		array_push( _array, _struct);
	}
	
	with(oBonepile)
	{
		var _struct = 
		{
			object: object_get_name( object_index),
			x: x,
			y: y,
			image_index: image_index,
			dx: dx,
			dy: dy,
			face: face
		}
		array_push( _array, _struct);
	}
	
	with(oSlime)
	{
		var _struct = 
		{
			object: object_get_name( object_index),
			x: x,
			y: y,
			image_index: image_index,
			hit: hit,
			xDir: xDir,
			xspd: xspd,
			yspd: yspd,
			aggro: aggro,
			onGround: onGround,
			idle: idle,
			jumpStep: jumpStep
		}
		array_push( _array, _struct);
	}	
	
	with(oPlayer)
	{
		var _struct = 
		{
			object: object_get_name( object_index),
			x: x,
			y: y,
			image_index: image_index,
			split: split,
			souls: souls,
			throwTimer: throwTimer,
			isAttacking: isAttacking,
			throw_x: throw_x,
			iFrames: iFrames,
			face: face,
			xDir: xDir,
			yDir: yDir,
			onWall: onWall,
			runType: runType,
			xspd: xspd,
			yspd: yspd,
			onGround: onGround,
			jumpCount: jumpCount,
			jumpHoldTimer: jumpHoldTimer,
			wallBoost: wallBoost,
			coytoeHangTimer: coytoeHangTimer,
			coyoteJumpTimer: coyoteJumpTimer
		};
		array_push( _array, _struct);
	}
	
	struct_set( global.game_data.room_data, room_get_name(room), _array);
	
}

function load_game()
{

	if( file_exists( "save.txt")) 
	{
		var _buffer = buffer_load( "save.txt");
	
		var _json = buffer_read( _buffer, buffer_string);
	
		buffer_delete( _buffer);
		
		global.game_data = json_parse( _json);
		
		room_goto(global.activeRoom);
		
		load_room();

	}

}

function load_room()
{
	var _array = struct_get( global.game_data.room_data, room_get_name(room));
	
	if( _array != undefined)
	{
		instance_destroy(oSouls);
		instance_destroy(oBonepile);
		instance_destroy(oSlime);
		instance_destroy(oPlayer);
		
		for( var i = 0; i < array_length( _array); i += 1) 
		{
			var _struct = _array[ i];
			var obj = instance_create_layer( _struct.x, _struct.y, "Instances", asset_get_index( _struct.object));
			loadStruct(obj.id, _struct);
			
		}
	
	}

}