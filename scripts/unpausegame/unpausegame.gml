function UnpauseGame(){
	with(Par_Entity){
		speed = pause_tempSpeed;
	}
	with(Par_projectile){
		speed = pause_tempSpeed;
	}
}