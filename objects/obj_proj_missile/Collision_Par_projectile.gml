/// @description Destroy self
if(other.owner != self && other.team != team){
	instance_destroy(other);
	instance_destroy(self);
}