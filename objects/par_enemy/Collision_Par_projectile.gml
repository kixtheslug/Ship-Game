/// @description Take damage
if(other.owner != self && other.team != team){ //maybe allow friendly fire?
	alert = true;
	alarm[1] = room_speed*5;
	
	hp-=other.damage;
	instance_destroy(other);
}