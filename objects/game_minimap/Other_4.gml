surfMinimapBg = -1;
surfMinimapEntities = -1;
scale = 80;
w = room_width/scale;
h = room_height/scale;
x = Game_Camera.camera_width/2-w
y = view_hport[0]-h-10

//Refresh background
function RefreshMapBG(){
	surfMinimapBg = surface_create(w,h);
	var surfTemp = surface_create(room_width, room_height);
	surface_set_target(surfTemp)
	draw_clear(c_black);
	surface_reset_target();
	surface_set_target(surfMinimapBg);
	draw_surface_stretched(surfTemp,0,0,w,h);
	surface_reset_target();
	surface_free(surfTemp);
}

//Init background
RefreshMapBG();