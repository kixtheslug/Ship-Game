draw_set_font(fnt_pixel_small)

//select mode
if(selectMode){
	draw_set_alpha(0.1);
	draw_set_color(c_lime);
	draw_rectangle(0,0,camera_width,camera_height,0)
	
	//draw stats on side
	draw_set_alpha(0.5);
	draw_set_color(c_grey);
	draw_rectangle(camera_width-300, 30, camera_width-30,400,0);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fnt_pixel_large)
	draw_set_halign(fa_center);
	draw_text(camera_width/2, 30,"SELECT MODE ACTIVE");
	draw_set_font(fnt_pixel_small)
	draw_text(camera_width/2, 70,"Hold Ctrl and use WASD to pan view. Click to swap to highlighted unit.");
	
	//draw unit stats
	draw_set_font(fnt_pixel_large)
	draw_text(camera_width-165, 30,"Player Unit");
	draw_set_halign(fa_left);
	draw_set_font(fnt_pixel_small)
	draw_text(camera_width-290, 90,"Health: " + string(selectable.hp) + "/" + string(selectable.maxhp));
	draw_text(camera_width-290, 90,"Health: " + string(selectable.hp) + "/" + string(selectable.maxhp));
	
	draw_set_font(fnt_pixel_small)
}

if(paused){
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fnt_pixel_large)
	draw_set_halign(fa_center);
	draw_text(camera_width/2, 30,"PAUSED");
	draw_set_font(fnt_pixel_small)
	draw_text(camera_width/2, 70,"Press Escape to unpause. Press R to reload level.");
	
	if (keyboard_check_pressed(ord("R"))) game_restart();
}