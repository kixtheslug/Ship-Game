draw_set_alpha(1);
//draw base
draw_set_color(c_white);

//draw turret
if(team = Game_ListHandler.teamList.player){
	draw_sprite(spr_turret_base_player,0,x,y);
	draw_sprite_ext(spr_turret_barrel_player,0,x,y,1,1,direction,c_white,1);
} else {
	draw_sprite(spr_turret_base_enemy,0,x,y);
	draw_sprite_ext(spr_turret_barrel_enemy,0,x,y,1,1,direction,c_white,1);
}

//healthbar
var currentHealth = (hp/maxhp)*100
if(team=Game_ListHandler.teamList.player) draw_healthbar(x-20, y+35, x+20, y+40, currentHealth, c_white, c_green, c_green, 0, 1, 1);
else draw_healthbar(x-20, y+35, x+20, y+40, currentHealth, c_white, c_red, c_red, 0, 1, 1);

if (global.showAdvancedInfo) {
	draw_set_colour(c_red);
	draw_set_alpha(0.25);
	draw_circle(x, y, viewRad, 1);
	
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_text(x,y-50,string(direction));
}
