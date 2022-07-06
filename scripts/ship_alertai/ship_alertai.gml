// Enemy is on alert but cannot see the player
function Ship_AlertAI(){
	wantsToReturn = true

	var differenceInAnglesToExplore = abs(angleToExplore-image_angle);
	
	if(!hasRoute){
		angleToExplore = random_range(0,359)
		distanceToExplore = random_range(90,90)
		exploreX = x + lengthdir_x(distanceToExplore, angleToExplore)
		exploreY = y + lengthdir_y(distanceToExplore, angleToExplore)
		
		hasRoute = true
	} else if (hasRoute){
		if(!lostControl){ //disable AI if lost control
			if (image_angle != angleToExplore){
				if(image_angle > angleToExplore) image_angle -= rotatespd;
				else if (image_angle < angleToExplore) image_angle += rotatespd;
			}
		
			if(differenceInAnglesToExplore<=60){
				motion_add(image_angle, movespd)
				moving = true
			}
		}
	}
	
	if(distance_to_point(exploreX,exploreY)<=satisfiedRad){
		hasRoute = false;
	}
}