// memory leak bad lol
audio_emitter_free(emitter);

var number = sprite_get_number(sSlimeDeathBossUpdated);

for (var i=0; i<number; i++) 
{
	var bpx = x + random_range(-8, 8);
	var bpy = y + random_range(-24, 8);
	var bodypart = instance_create_layer(bpx, bpy, "Instances",oSlimeBossParts);
	bodypart.size = size / maxSize;
	bodypart.color = color;
	bodypart.direction = 140 - (image_xscale * random_range(30,90));
	bodypart.speed = random_range(3,14);
	bodypart.image_index = i;
	//if i == 5 bodypart.image_angle = 130;
}