draw_set_alpha(1);
draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,c_white,1); //outline
draw_self()

var currentHealth = (hp/maxhp)*100
//controls healthbar color
if(playerUnit) draw_healthbar(x-10, y+15, x+10, y+20, currentHealth, c_white, c_green, c_green, 0, 1, 1);
else draw_healthbar(x-10, y+15, x+10, y+20, currentHealth, c_white, c_red, c_red, 0, 1, 1);

if (global.showAdvancedInfo && AIEnabled) {
	draw_set_colour(c_red);
	draw_set_alpha(0.25);
	draw_circle(x, y, viewRad, 1);
	
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_text(x,y-20,string(floor(direction)));
	
	draw_set_colour(c_blue);
	draw_set_alpha(0.25);
	draw_circle(x, y, rangeRad, 1);
	
	draw_set_colour(c_red);
	draw_set_alpha(0.5);
	draw_circle(idleX, idleY, satisfiedRad, 1);
	
	if(hasRoute){
		draw_set_colour(c_white);
		draw_set_alpha(0.5);
		draw_circle(exploreX, exploreY, satisfiedRad, 0);
	}
}