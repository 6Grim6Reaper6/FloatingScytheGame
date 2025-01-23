if place_meeting(x,y, oPlayer) && !instance_exists(oWarp)
	{
	 var _inst = instance_create_depth(0,0,-9999,oWarp);
	 _inst.target_x = target_x;
	 _inst.target_y = target_y;
	 _inst.target_rm = target_rm;
	 _inst.target_face = target_face;
	}