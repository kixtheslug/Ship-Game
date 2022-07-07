draw_set_alpha(1);

if(selected){
	//draw healthbar
	var currentHealth = (hp/maxhp)*100
	draw_healthbar(10, Game_Camera.camera_height-10, 150, Game_Camera.camera_height-40, currentHealth, c_white, c_red, c_red, 0, 1, 1);
	draw_set_color(c_red);
	draw_text(10,Game_Camera.camera_height-60,string(hp) + " / " + string(maxhp));

	//draw velocity and direction
	draw_set_color(c_white);
	if (!Game_Camera.paused && !Game_Camera.selectMode) draw_text(10,10,"Speed: " + string(speed));
	else draw_text(10,10,"Speed: " + string(pause_tempSpeed));
	draw_text(10,30,"Direction: " + string(true_angle));
	draw_text(x-10,y-20,"Coordinates: (" + string(floor(x)) + "," + string(floor(y)) + ")");
}