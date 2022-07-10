function PauseGame(){
	with(Par_Entity){
		pause_tempSpeed = speed;
		speed = 0;
	}
	with(Par_projectile){
		pause_tempSpeed = speed;
		speed = 0;
		show_debug_message(pause_tempSpeed);
	}
}