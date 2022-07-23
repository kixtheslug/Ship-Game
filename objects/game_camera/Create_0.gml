/// @description Camera for the game
randomise();
instance_create_layer(0,0,"Control",Game_Minimap);

selectedUnit = noone;
selectMode = false;
paused = false;
with(Par_player){
	if(selected) Game_Camera.selectedUnit = self;
}
canSelect = true;

// Initialise Viewports
cameraX = 0;
cameraY = 0;
camera_width = 1240
camera_height = 700

view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0], camera_width, camera_height);

display_scale = 1;
display_width = camera_width * display_scale;
display_height = camera_height * display_scale;

window_set_size(display_width,display_height);
surface_resize(application_surface,display_width,display_height);

//Zoom
zoom_level = 1;
target_zoom_level = zoom_level;
zoom_rate = 0.25;
zoom_buffer = 0.01;

//UI
display_set_gui_size(camera_width,camera_height);
global.showAdvancedInfo = false;