/// @desc Unpause
pause = false;
if (layer_exists("PauseMenu")) { layer_destroy_instances("PauseMenu");	layer_destroy_instances("PauseMenu"); }
if (layer_exists("Instances")) { instance_activate_layer("Instances"); }
if (pauseSurf != -1 and surface_exists(pauseSurf)) { surface_free(pauseSurf); }
if (pauseSurfBuffer != -1 and buffer_exists(pauseSurfBuffer)) { buffer_delete(pauseSurfBuffer); }