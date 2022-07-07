//Chases player
function Ship_ChaseAI(){
	wantsToReturn = true
	alert = false
	hasRoute = false
	
	if(!lostControl){ //disable AI if lost control
		RotateToTarget(self, target, rotatespd, 1);
		image_angle = direction;
		
		var targetDir = point_direction(x, y, target.x, target.y);
		var facingMinusTarget = direction - targetDir;
		var angleDiff = facingMinusTarget;
		if(abs(facingMinusTarget) > 180){
		    if(direction > targetDir) angleDiff = -1 * ((360 - direction) + targetDir);
			else angleDiff = (360 - targetDir) + direction;
		}

		// Gradually rotate object
		var tollerance = 30;
		if(angleDiff <= tollerance+10 or angleDiff <= tollerance-10)
		{
		    if (distanceToPlayer >= viewRad/1.5){ //if player is too far dash
				dashing = true;
				moving = false;
			}else if (distanceToPlayer >= viewRad/3){ //if player is nearby move closer but not too close
				ActivateWeapon(self, image_angle, true);
				motion_add(image_angle, movespd);
				moving = true
				dashing = false;
			} else { //otherwise stop moving
				ActivateWeapon(self, image_angle, true);
				dashing = false;
				moving = false;
			}
		}
	}
}