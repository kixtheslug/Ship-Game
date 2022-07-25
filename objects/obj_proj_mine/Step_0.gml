/// @description
switch(team){
	case Game_ListHandler.teamList.player:
		sprite_index = spr_proj_mine_player;
		if(instance_exists(Par_enemy) && !targetLock) target = instance_nearest(x,y,Par_enemy);
		else target = noone;
		break;
	
	case Game_ListHandler.teamList.hostile:
		sprite_index = spr_proj_mine_enemy;
		if(instance_exists(Par_player) && !targetLock) target = instance_nearest(x,y,Par_player);
		else target = noone;
		break;
	
	default:
		break;
}

if(image_index==3) image_speed = 0; //stop animating when fully extended

if(!Game_Camera.paused && !Game_Camera.selectMode){ //dont work if paused
	//detect enemy
	if(distance_to_object(target) <= viewRad){
		RotateToTarget(self, target, rotatespd, 1);
		motion_add(image_angle, movespd);
	} else speed = max(speed-0.05,0);
}

if (speed > 3) speed = 3;

if(hp<=0) instance_destroy();
if(flashAlpha>0) flashAlpha-=0.05;