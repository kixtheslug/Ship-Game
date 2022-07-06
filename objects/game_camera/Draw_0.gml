//select mode
if(selectMode){
	camera_set_view_target(view_camera[0], Game_Camera) //make this move with arrow keys instead
	camera_set_view_speed(view_camera[0], 10*zoom_level, 10*zoom_level)
	
	var selectableRange = 30;
	var nearestPlayer = instance_nearest(mouse_x,mouse_y,Par_player)
	if(point_distance(mouse_x, mouse_y, nearestPlayer.x, nearestPlayer.y)<=selectableRange) selectable = nearestPlayer;
	else selectable = selectedUnit;
	draw_set_alpha(0.25);
	draw_set_color(c_lime);
	draw_circle(selectable.x,selectable.y,30,0)
	
	if(mouse_check_button_pressed(mb_left)){
		with(Par_player) selected = false;
		selectedUnit = selectable;
		selectable.selected = true;
		selectMode = false;
		UnpauseGame();
	}
}