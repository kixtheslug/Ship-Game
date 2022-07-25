/// @description Destroy self
if(other.owner != self && other.team != team){
	instance_destroy(other);
	
	hp-=other.damage;
	flashAlpha = 1;
}