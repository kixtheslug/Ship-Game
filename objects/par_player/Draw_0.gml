/// @description draw self
draw_set_alpha(1);
draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,c_white,1); //outline
draw_self();
shader_reset();

if(!selected){
	var currentHealth = (hp/maxhp)*100
	draw_healthbar(x-10, y+15, x+10, y+20, currentHealth, c_white, c_green, c_green, 0, 1, 1);
}