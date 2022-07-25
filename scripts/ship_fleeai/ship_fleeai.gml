// Enemy is fleeing from player
function Ship_FleeAI(){
	//var angleToFlee = 180+angleToPlayer*random_range(0.5,1.5);
	//var differenceInAnglesToFlee = abs(angleToFlee-image_angle);
	
	if(!lostControl){ //disable AI if lost control
		RotateAwayTarget(self, point_direction(x, y, target.x, target.y), rotatespd, 1);
	
		if (distanceToPlayer <= viewRad/2){
			dashing = true;
			moving = false;
		} else {
			motion_add(image_angle, movespd);
			moving = true
			dashing = false;
		}
	}
	
	 wantsToReturn = true;
	 alert = false;
	 hasRoute = false
}