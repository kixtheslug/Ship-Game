/// @description Take damage
if(other.owner != self && other.team != team && !destroyed){ //maybe allow friendly fire?
	hp-=other.damage;
	instance_destroy(other);
	
	flashAlpha = 1;
}