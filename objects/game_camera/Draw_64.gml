draw_set_font(fnt_pixel_small)

if(Settings.DevMode) draw_text_color(0,0,"Dev Mode",c_yellow,c_yellow,c_yellow,c_yellow,1);

if(room != Menu){
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
		draw_text(camera_width/2, 70,"Press Shift to rotate units. Click to swap to highlighted unit.");
	
		//draw unit stats
		draw_set_font(fnt_pixel_large)
		draw_text(camera_width-165, 30,"Player Unit");
		draw_set_halign(fa_left);
		draw_set_font(fnt_pixel_small)
		draw_text(camera_width-290, 90,"Health: " + string(selectable.hp) + "/" + string(selectable.maxhp));
		draw_text(camera_width-290, 90,"Health: " + string(selectable.hp) + "/" + string(selectable.maxhp));
	
		draw_set_font(fnt_pixel_small)
		draw_set_halign(fa_left);
	}

	if(paused){
		//darken screen
		draw_set_alpha(0.75);
		draw_set_color(c_black);
		draw_rectangle(0,0,camera_width,camera_height,0)
	
		//draw paused menu
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(fnt_pixel_large)
		draw_set_halign(fa_center);
		draw_text(camera_width/2, 30,"PAUSED");
		draw_set_font(fnt_pixel_small)
	
		
		//debug mode controls
		if(Settings.DevMode){
			draw_set_color(c_yellow);
			draw_text(camera_width/2, 70,"Press R to reload level.");
			draw_set_halign(fa_left);
			if (keyboard_check_pressed(ord("R"))) room_restart();
			
			//invincible player
			draw_sprite(UI_checkbox,Settings.dev_invinciblePlayer,10,100);
			draw_text(30, 100,"[1] Invincible Player");
			draw_sprite(UI_checkbox,Settings.dev_invincibleEnemies,10,120);
			draw_text(30, 120,"[2] Invincible Enemies");
			draw_sprite(UI_checkbox,Settings.dev_endlessZoom,10,140);
			draw_text(30, 140,"[3] Infinite Zoom");
		}
	}
} else zoom_level = 1.5; //zoom out if on menu

draw_set_font(fnt_pixel_small)
draw_set_halign(fa_left);