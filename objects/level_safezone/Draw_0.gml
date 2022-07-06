/// @description Draw safezone
//DO NOT DRAW SELF

switch (team){
	case Game_ListHandler.teamList.player:
		color = c_red;
		break;
		
	case Game_ListHandler.teamList.hostile:
		color = c_silver;
		break;
	
	case Game_ListHandler.teamList.neutral:
		color = c_orange;
		break;
	
	default:
		color = c_orange;
		break;
}

draw_set_colour(color);
draw_set_alpha(0.25);
draw_rectangle(x, y, x+zoneWidth, y+zoneHeight, 0);
draw_set_alpha(1);
draw_set_colour(c_green);
for (var i = 0; i < 10; i += 0.5) draw_rectangle(x-i, y-i, x+zoneWidth+i, y+zoneHeight+i, 1);