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
}
