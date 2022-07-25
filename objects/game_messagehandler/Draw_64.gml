/// @description Draw Messages
draw_set_font(fnt_pixel_small);

if(array_length(messages)>max_messages){
	array_delete(messages, array_length(messages)-1, 1);
}

for(var i = 1; i <= array_length(messages); i++){
	draw_set_halign(fa_center);
	
	draw_set_alpha(messages[i-1,1]/room_speed);
	draw_text(Game_Camera.camera_width/2,Game_Camera.camera_height/2+30*i,messages[i-1,0]);
	draw_set_halign(fa_left);
	messages[i-1,1]--;
	
	if(messages[i-1,1]<=0) array_delete(messages, i-1, 1);
	draw_set_alpha(1);
}