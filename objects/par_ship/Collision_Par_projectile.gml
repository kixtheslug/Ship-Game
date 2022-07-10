/// @description Take damage
if(other.owner != self && other.team != team){ //maybe allow friendly fire?
	alert = true;
	alarm[2] = room_speed*5;
	
	if (!invincible) hp-=other.damage;
	instance_destroy(other);
}