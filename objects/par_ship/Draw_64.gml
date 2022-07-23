draw_set_alpha(1);

if(selected && playerUnit && !Game_Camera.paused){
	//draw error messages
	if(messageNoTarget){
		draw_set_halign(fa_center)
		draw_text(Game_Camera.camera_width/2,Game_Camera.camera_height/2+30,"Cannot find valid target. Must be within range of an enemy.");
		draw_set_halign(fa_left)
	}
	
	if(skill == skills.Dash){ //draw healthbar in the right position
		//draw healthbar
		var currentHealth = (hp/maxhp)*100
		draw_healthbar(10, Game_Camera.camera_height-20, 150, Game_Camera.camera_height-40, currentHealth, c_white, c_red, c_red, 0, 1, 1);
		draw_set_color(c_red);
		draw_text(10,Game_Camera.camera_height-60,string(hp) + " / " + string(maxhp));
		//draw skill duration
		var currentSkill = (skillDuration/skillMaxDuration)*100
		draw_healthbar(10, Game_Camera.camera_height-5, 150, Game_Camera.camera_height-15, currentSkill, c_black, c_yellow, c_yellow, 0, 1, 1);
	} else {
		//draw healthbar
		var currentHealth = (hp/maxhp)*100
		draw_healthbar(10, Game_Camera.camera_height-10, 150, Game_Camera.camera_height-30, currentHealth, c_white, c_red, c_red, 0, 1, 1);
		draw_set_color(c_red);
		draw_text(10,Game_Camera.camera_height-60,string(hp) + " / " + string(maxhp));
	}
	
	//draw velocity and direction
	draw_set_color(c_white);
	if (!Game_Camera.paused && !Game_Camera.selectMode) draw_text(10,10,"Speed: " + string(speed));
	else draw_text(10,10,"Speed: " + string(pause_tempSpeed));
	draw_text(10,30,"Direction: " + string(true_angle));
	draw_set_halign(fa_center);
	draw_text(Game_Camera.camera_width/2,Game_Camera.camera_height-130,"Coordinates: (" + string(floor(x)) + "," + string(floor(y)) + ")");
	draw_set_halign(fa_left);
	
	//draw toggles
	draw_sprite(UI_dampening,damp,10,100);
	if(smartTarget != noone) draw_sprite(UI_smartTarget,1,10,148);
	else draw_sprite(UI_smartTarget,0,10,148);
}