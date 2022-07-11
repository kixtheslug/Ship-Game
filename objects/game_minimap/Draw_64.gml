/// @description Draw minimap
x = Game_Camera.camera_width/2-w/2;

if(room != Menu && !Game_Camera.paused){
	draw_set_alpha(0.75)

	//draw background
	if (!surface_exists(surfMinimapBg)) RefreshMapBG();
	draw_surface(surfMinimapBg,x,y);
	draw_set_color(c_white);
	draw_rectangle(x,y,x+w,y+h,1);

	//draw entities
	if (!surface_exists(surfMinimapEntities)) surfMinimapEntities = surface_create(w,h);
	surface_set_target(surfMinimapEntities);
	draw_clear_alpha(c_black,0);

	//Level_Safezone
	with (Level_Safezone){
		draw_sprite_ext
		(
			map_zone,
			0,
			x/Game_Minimap.scale,
			y/Game_Minimap.scale,
			zoneWidth/Game_Minimap.scale,
			zoneHeight/Game_Minimap.scale,
			0,
			color,
			0.75
		);
	}
	//player
	with (Par_player){
		draw_sprite_ext
		(
			map_player,
			0,
			x/Game_Minimap.scale,
			y/Game_Minimap.scale,
			1,
			1,
			0,
			c_white,
			1
		);
	}
	//enemies
	with (Par_enemy){
		draw_sprite_ext
		(
			map_enemy,
			0,
			x/Game_Minimap.scale,
			y/Game_Minimap.scale,
			1,
			1,
			0,
			c_white,
			1
		);
	}
	//asteroid
	with (Par_resource){
		draw_sprite_ext
		(
			map_asteroid,
			0,
			x/Game_Minimap.scale,
			y/Game_Minimap.scale,
			1,
			1,
			0,
			c_white,
			1
		);
	}

	surface_reset_target();
	draw_surface(surfMinimapEntities,x,y);

	draw_set_alpha(1)
}