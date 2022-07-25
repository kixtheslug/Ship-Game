/// @description Destroy self
if(other.owner != self && other.team != team){
	if(other != obj_proj_mine) instance_destroy(other);
	instance_destroy(self);
}