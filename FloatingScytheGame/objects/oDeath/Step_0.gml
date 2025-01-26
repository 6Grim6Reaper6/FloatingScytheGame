if image_index = 6{
	var number = sprite_get_number(sPlayerIdleScytheDeath);
	for (var i=0; i<number; i++) 
	{
	var bpx = oDeath.x + random_range(-8, 8);
	var bpy = oDeath.y + random_range(-24, 8);
	var bodypart = instance_create_layer(bpx, bpy, "Instances",oPlayerScytheParts);
	bodypart.direction = 140 - (image_xscale * random_range(30,90));
	bodypart.speed = random_range(3,14);
	bodypart.image_index = i;
	//if i == 5 bodypart.image_angle = 130;
	}
	instance_create_layer(oDeath.x - 18, oDeath.y - 80, "Instances", oGameOverText);
	var _button = instance_create_depth(oDeath.x - 20, oDeath.y - 70, oDeath.depth - 1, oNewGameButton);
	_button.image_xscale = 3.5;
	_button.text = "Start Over";
	
	_button = instance_create_depth(oDeath.x - 20, oDeath.y - 50, oDeath.depth - 1, oMainMenuButton);
	_button.image_xscale = 3.5;
}
