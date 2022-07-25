/// @description Draw settings menu
draw_set_font(fnt_pixel_medium);
draw_set_halign(fa_center);

if(settingsActive && instance_exists(Game_Camera)){
	instance_deactivate_object(MenuHandler);
	
	/*--------------------------------------
				MAIN MENU
	--------------------------------------*/
	for(var i = 0; i < array_length(SettingsOptions); i++){
		if(currSel == i) draw_set_color(c_yellow); //change color for selected option
		else draw_set_color(c_white);
		
		draw_text(Game_Camera.camera_width/2, 200+i*30,SettingsOptions[i]);
	}	


	draw_set_font(fnt_pixel_small);
	draw_set_halign(fa_left);

	if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) currSel++; //change selection
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) currSel--;

	if(currSel>array_length(SettingsOptions)-1) currSel = 0 //wrap around
	if(currSel<0) currSel = array_length(SettingsOptions)-1

	if(keyboard_check_pressed(vk_space)){
		switch (currSel){
			case 0: //Graphics
				break;
				
			case 1: //Audio
				break;
				
			case 2: //Gameplay
				break;
				
			case 3: //Controls
				break;
				
			case 4: //Return
				settingsActive = false;
				break;
			
			default:
				break;
		}
	}
} else instance_activate_object(MenuHandler);

//Dev Mode
if(keyboard_check_pressed(ord("U"))){
	if(DevMode) DevMode = false;
	else DevMode = true;
}


if(instance_exists(Game_Camera) && Game_Camera.paused){
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



draw_set_halign(fa_left);