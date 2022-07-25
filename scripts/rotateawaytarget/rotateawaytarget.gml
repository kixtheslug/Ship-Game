function RotateAwayTarget(obj, tar, spd, acc){
	var objToTurn = argument0;
	var target = argument1;
	var turnSpeed = argument2; 
	var accuracy = clamp(argument3, 0.05, 0.95);    // Don't want perfect accuracy or perfect inaccuracy

	// Test if parameters are valid
	if(!instance_exists(objToTurn)) return -1;
	if(!instance_exists(target)) return -1;

	// Reverse nomalize accuracy for calculations
	accuracy = abs(accuracy - 1.0);

	// Get the target direction and facing direction
	var targetDir = point_direction(objToTurn.x, objToTurn.y, target.x, target.y)+180;
	var facingDir = objToTurn.direction;

	// Calculate the difference between target direction and facing direction
	var facingMinusTarget = facingDir - targetDir;
	var angleDiff = facingMinusTarget;
	if(abs(facingMinusTarget) > 180){
	    if(facingDir > targetDir){
	        angleDiff = -1 * ((360 - facingDir) + targetDir);
	    }
	    else{
	        angleDiff = (360 - targetDir) + facingDir;
	    }
	}

	// Gradually rotate object
	var leastAccurateAim = 30;
	if(angleDiff > leastAccurateAim * accuracy){
	    objToTurn.direction -= turnSpeed;
	}
	else if(angleDiff < leastAccurateAim * accuracy){
	    objToTurn.direction += turnSpeed;
	}
}