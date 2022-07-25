/// @description Draw Menu

draw_set_font(fnt_pixel_medium);
draw_set_halign(fa_center);

if(room == Menu){
	/*--------------------------------------
				MAIN MENU
	--------------------------------------*/
	for(var i = 0; i < array_length(MainOptions); i++){
		if(currSel == i) draw_set_color(c_yellow); //change color for selected option
		else draw_set_color(c_white);
		
		draw_text(Game_Camera.camera_width/2, 200+i*30,MainOptions[i]);
	}	


	draw_set_font(fnt_pixel_small);
	draw_set_halign(fa_left);

	if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) currSel++; //change selection
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) currSel--;

	if(currSel>array_length(MainOptions)-1) currSel = 0 //wrap around
	if(currSel<0) currSel = array_length(MainOptions)-1

	if(keyboard_check_pressed(vk_space)){
		switch (currSel){
			case 0: //continue
				room_goto(Test_map); //temporary
				break;
				
			case 1: //new game
				room_goto(Level_Select);
				break;
				
			case 2: //settings
				Settings.alarm[0] = 1;
				break;
				
			case 3: //quit
				game_end();
				break;
			
			default:
				break;
		}
	}
} else{
	/*--------------------------------------
				PAUSE MENU
	--------------------------------------*/
	for(var i = 0; i < array_length(PauseOptions); i++){
		if(currSel == i) draw_set_color(c_yellow); //change color for selected option
		else draw_set_color(c_white);
		
		draw_set_halign(fa_center);
		draw_text(Game_Camera.camera_width/2, 200+i*30,PauseOptions[i]);
	}	


	draw_set_font(fnt_pixel_small);
	draw_set_halign(fa_left);

	if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) currSel++; //change selection
	if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) currSel--;

	if(currSel>array_length(PauseOptions)-1) currSel = 0 //wrap around
	if(currSel<0) currSel = array_length(PauseOptions)-1

	if(keyboard_check_pressed(vk_space)){
		switch (currSel){
			case 0: //Return
				Game_Camera.paused = false;
				instance_destroy(self);
				UnpauseGame();
				break;
				
			case 1: //save
				break;
				
			case 2: //settings
				Settings.alarm[0] = 1;
				break;
				
			case 3: //quit to menu
				Game_Camera.paused = false;
				UnpauseGame();
				room_goto(Menu);
				break;
				
			case 4: //quit game
				game_end();
				break;
			
			default:
				break;
		}
	}
}

draw_set_font(fnt_pixel_small)
draw_set_halign(fa_left);