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

if ((keyboard_check_pressed(vk_escape) or not waitFrame) and not asset_has_tags(room, "Menu", asset_room))
{
	if (not pause)
	{ // pausing		
		if (waitFrame)
		{
			waitFrame = false;
			// draw buttons
			if (not layer_exists("PauseMenu")) { layer_create(depth - 1, "PauseMenu"); }
		    instance_create_layer(oCamera.finalCamX + 240, oCamera.finalCamY + 100, "PauseMenu", oResume, {image_xscale: 3.5});
			instance_create_layer(oCamera.finalCamX + 240, oCamera.finalCamY + 120, "PauseMenu", oRestartButton, {image_xscale: 3.5, text: "Restart"});
			//instance_create_layer(oCamera.finalCamX + 240, oCamera.finalCamY + 140, "PauseMenu", oSettings, {image_xscale: 3.5});
			instance_create_layer(oCamera.finalCamX + 240, oCamera.finalCamY + 160, "PauseMenu", oMainMenuButton, {image_xscale: 3.5});
			instance_activate_layer("PauseMenu");
		}
		else
		{		
			pause = true;
			waitFrame = true;
			instance_deactivate_layer("Instances");
			//instance_deactivate_all(true);
			pauseSurf = surface_create(resW, resH);
			surface_set_target(pauseSurf);
				
			draw_surface(application_surface, 0, 0);	
			surface_reset_target();
				
			if (buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }
			pauseSurfBuffer = buffer_create(resW * resH * 4, buffer_fixed, 1);
			buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
		}
	}
	else
	{
		event_user(0);
	}
}


gpu_set_blendenable(true);

