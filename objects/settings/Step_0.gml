/// @description Insert description here

//Dev Mode
if(keyboard_check_pressed(ord("U"))){
	if(DevMode) DevMode = false;
	else DevMode = true;
}


if(Game_Camera.paused){
	//invincible player
	if(keyboard_check_pressed(ord("1"))){
		if(dev_invinciblePlayer) dev_invinciblePlayer = false;
		else dev_invinciblePlayer = true;
	}
	
	if(keyboard_check_pressed(ord("2"))){
		if(dev_invincibleEnemies) dev_invincibleEnemies = false;
		else dev_invincibleEnemies = true;
	}
	
	if(keyboard_check_pressed(ord("3"))){
		if(dev_endlessZoom) dev_endlessZoom = false;
		else dev_endlessZoom = true;
	}
}