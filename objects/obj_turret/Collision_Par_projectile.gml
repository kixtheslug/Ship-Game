/// @description Take damage
if(other.owner != self && other.team != team){ //maybe allow friendly fire?
	hp-=other.damage;
	instance_destroy(other);
}