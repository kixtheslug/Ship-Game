draw_set_color(c_white);
draw_set_alpha(1);
draw_self();

RotateToTarget(self, obj_player, 10, 1);
image_angle = direction;

distanceToPlayer = distance_to_object(obj_player);
var targetDir = point_direction(x, y, obj_player.x, obj_player.y);
var facingMinusTarget = direction - targetDir;
var angleDiff = facingMinusTarget;
if(abs(facingMinusTarget) > 180){
	if(direction > targetDir){
		angleDiff = -1 * ((360 - direction) + targetDir);
	}
	else{
		angleDiff = (360 - targetDir) + direction;
	}
}

// Gradually rotate object
var tollerance = 30;
if(angleDiff <= tollerance+10 or angleDiff <= tollerance-10)
{
	draw_text(x,y+30,"In range!");
}