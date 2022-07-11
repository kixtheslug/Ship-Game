draw_set_alpha(1);
draw_self()

if(room != Menu){
	var currentHealth = (hp/maxhp)*100
	draw_healthbar(x-10, y+17, x+10, y+20, currentHealth, c_white, c_red, c_red, 0, 1, 1);
}