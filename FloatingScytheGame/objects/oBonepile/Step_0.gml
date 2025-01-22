{//Movement
	//horizontal collision
		if(not place_free(x+dx,y)){
		if(abs(dx) >= 2){
			//bounce
			dx = -dx*bounce_factor;
		}else{
			// move_contact_solid
			move_contact_solid((dx > 0)? 0 : 100, abs(dx));
			dx = 0;	
		}
	}
	
		//Direction
	moveDir = round(dx / 5);
	//Get my face
	if moveDir != 0 {face = moveDir;};
	//friction
	if (not place_free(x,y+1)){
		dx *= fr;
	}
	
	//gravity
	dy += grav;
	//vertical collision
	if(not place_free(x,y+dy)){
		if(abs(dy) >= 2){
			//bounce
			dy = -dy*bounce_factor;
		}else{
			// move_contact_solid
			move_contact_solid((dy > 0)? 270 : 90, abs(dy));
			dy = 0;
		}
	}
	//apply movement
	x += dx;
	y += dy;
}