if(!lostControl){ 
	hp-=10;
	var collision_speed = (speed + other.speed)/2
	direction=other.true_angle;
	speed = collision_speed;

	lostControl = true;
	alarm[11] = room_speed*2;
	
	flashAlpha = 1;
}
