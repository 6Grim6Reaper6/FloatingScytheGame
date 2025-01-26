/// @desc Unpause
pause = false;
layer_destroy("PauseMenu");
instance_activate_all();
if (surface_exists(pauseSurf)) { surface_free(pauseSurf); }
if (buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }
