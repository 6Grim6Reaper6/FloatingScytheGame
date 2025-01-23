gpu_set_blendenable(false);

if (pause)
{
	surface_set_target(application_surface);
	if (surface_exists(pauseSurf)) { draw_surface(pauseSurf, 0, 0); }
	else
	{
		pauseSurf = surface_create(resW, resH);	
		buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	surface_reset_target();
}

if ((keyboard_check_pressed(vk_escape); or global.paused) and not asset_has_tags(room, "Menu", asset_room);)
{
	global.paused = false;
	if (not pause) 
	{
		pause = true;
		
		instance_deactivate_all(true);
		
		pauseSurf = surface_create(resW, resH);
		surface_set_target(pauseSurf);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		if (buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }
		pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	else
	{
		//global.paused = false;
		pause = false;
		instance_activate_all();
		if (surface_exists(pauseSurf)) { surface_free(pauseSurf); }
		if (buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }
	}
}


gpu_set_blendenable(true);


/*
gpu_set_blendenable(false);

if (pause) {
    // Set target to the application surface for drawing
    surface_set_target(application_surface);

    // Draw the game pause snapshot if it exists
    if (surface_exists(pauseSurf)) {
        draw_surface(pauseSurf, 0, 0);
    } else {
        pauseSurf = surface_create(resW, resH);
        buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
    }
	
	gpu_set_blendenable(true);
    // Draw the semi-transparent background
    draw_set_alpha(0.5);
    draw_rectangle_color(0, 0, resW, resH, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);

    // Draw menu options
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(resW / 2, resH / 2 - 40, "Game Paused");
    draw_text(resW / 2, resH / 2, "Press ESC to Resume");
    draw_text(resW / 2, resH / 2 + 40, "Press Q to Quit");
	gpu_set_blendenable(false);

    surface_reset_target();
}

if ((keyboard_check_pressed(vk_escape) or global.paused) && !asset_has_tags(room, "Menu", asset_room)) {
    global.paused = false;

    if (!pause) {
        pause = true;

        // Deactivate objects and create the pause surface
        instance_deactivate_all(true);

        pauseSurf = surface_create(resW, resH);
        surface_set_target(pauseSurf);
        draw_surface(application_surface, 0, 0);
        surface_reset_target();

        if (buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }
        pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
        buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
    } else {
        pause = false;
        instance_activate_all();

        // Clean up surfaces and buffers
        if (surface_exists(pauseSurf)) { surface_free(pauseSurf); }
        if (buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }
    }
}

// Check additional input for quitting the game
if (pause) {
    if (keyboard_check_pressed(ord("Q"))) {
        game_end(); // Quits the game
    }
}

gpu_set_blendenable(true);*/
