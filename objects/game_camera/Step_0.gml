//Control Zoom

cameraX = selectedUnit.x - camera_width*zoom_level/2;
cameraY = selectedUnit.y - camera_height*zoom_level/2;

cameraX = clamp(cameraX, 0, room_width-camera_width*zoom_level);
cameraY = clamp(cameraY, 0, room_width-camera_height*zoom_level);

camera_set_view_pos(view_camera[0], cameraX, cameraY);

/*if(instance_exists(selectedUnit)){
	global.cameraX = selectedUnit.x - camera_width/2;
	global.cameraY = selectedUnit.y - camera_width/2;
	
	
}
camera_set_view_pos(view_camera[0],global.cameraX,global.cameraY);*/

camera_set_view_size(view_camera[0], camera_width*zoom_level, camera_height*zoom_level)
camera_set_view_speed(view_camera[0], 20*zoom_level, 20*zoom_level)

if(room != Menu){
	if (mouse_wheel_down() || keyboard_check_pressed(vk_add)) if (zoom_level < 2 || Settings.dev_endlessZoom) zoom_level += zoom_rate; //zoom out
	if (mouse_wheel_up()) if (zoom_level > 0.5 || Settings.dev_endlessZoom) zoom_level -= zoom_rate; //zoom in

	if(!selectMode){
		if(instance_exists(selectedUnit)){
			x = selectedUnit.x;
			y = selectedUnit.y;
		} else {
			if(instance_exists(Par_player)){
				var newUnit = instance_nearest(x,y,Par_player);	
				selectedUnit = newUnit;
				newUnit.selected = true;
			} else {
				selectedUnit = noone;
				//gameover!
			}
		}
	} else{ //move with movement controls
		var cameraMoveDistance = 500
		if(distance_to_object(instance_nearest(mouse_x,mouse_y,Par_player))<cameraMoveDistance){
			var cameraMoveSpeed = 20
			if (keyboard_check(ord("W"))) y-=cameraMoveSpeed;
			if (keyboard_check(ord("S"))) y+=cameraMoveSpeed;
			if (keyboard_check(ord("A"))) x-=cameraMoveSpeed;
			if (keyboard_check(ord("D"))) x+=cameraMoveSpeed;
		} else{
			if(instance_exists(selectedUnit)){
				x = selectedUnit.x;
				y = selectedUnit.y;
			}
		}
	}

	with(Par_player){ //change view if new unit is selected
		if(selected) selectedUnit = self;
	}
	//if(!selectMode) camera_set_view_target(view_camera[0], selectedUnit)

	//Toggle UI Elements
	if (keyboard_check_pressed(ord("B"))){ //toggle advanced UI
		if(global.showAdvancedInfo) global.showAdvancedInfo = false
		else global.showAdvancedInfo = true
	}

	//toggle select mode
	if (keyboard_check_pressed(vk_control) && !paused){
		if(selectMode){
			selectMode = false;
			UnpauseGame();
		}else {
			PauseGame();
			selectMode = true;
		}
	}

	//pause game
	if (keyboard_check_pressed(vk_escape) && !selectMode){
		if(paused){
			paused = false;
			instance_destroy(MenuHandler);
			UnpauseGame();
		}else {
			PauseGame();
			instance_create_layer(0,0,"Control",MenuHandler);
			paused = true;
		}
	}
}