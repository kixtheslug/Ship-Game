/// @description Collide with other entities
if((other.team != team) || team==Game_ListHandler.teamList.none){ //do not collide with friendlies
	if(!lostControl){ 
		if (!invincible) hp-=10;
		var collision_speed = (speed + other.speed)/2
		direction+=180;
		speed = collision_speed;

		lostControl = true;
		alarm[11] = room_speed*2;
	}
}