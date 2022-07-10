draw_sprite_ext(planet,0,planetPosX,planetPosY,planetScale,planetScale,planetRot,c_white,0.5);

/// @description Draw Boundary
if(showBorder){
	draw_set_colour(c_orange);
	draw_set_alpha(1);
	for (var i = 0; i < 10; i += 0.5) draw_rectangle(padding-i, padding-i, width+i, height+i, 1);
}