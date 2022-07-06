team = zone.team;
color = zone.color;

switch(team){
	case Game_ListHandler.teamList.player:
		if(instance_exists(Par_enemy)) target = instance_nearest(x,y,Par_enemy);
		else target = noone;
		break;
	
	case Game_ListHandler.teamList.hostile:
		if(instance_exists(Par_player)) target = instance_nearest(x,y,Par_player);
		else target = noone;
		break;
	
	default:
		break;
}

if(!Game_Camera.paused && !Game_Camera.selectMode){ //dont work if paused
	//detect enemy
	if(distance_to_object(target) <= viewRad){
		RotateToTarget(self, target, rotatespd, 1);
		ActivateWeapon(self, direction, true);
	}
}