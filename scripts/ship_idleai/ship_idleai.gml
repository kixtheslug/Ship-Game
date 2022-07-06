// Player is not detected and not on alert
function Ship_IdleAI(){
	dashing = false
	hasRoute = false
	
	if(wantsToReturn){
		var angleToPos = point_direction(x, y, idleX, idleY);
		
		if(!lostControl){ //disable AI if lost control
			if (image_angle != angleToPos){
				if(image_angle > angleToPos) image_angle -= rotatespd;
				else if (image_angle < angleToPos) image_angle += rotatespd;
			}
		
			motion_add(image_angle, movespd/2);
		
			if(distance_to_point(idleX,idleY)<=satisfiedRad){
				wantsToReturn = false;
				speed/=2;
			}
		}
	} else {
		idleX = x
		idleY = y
	}
}