/// @description Camera for the game
randomise();
instance_create_layer(0,0,"Control",Game_Minimap);

selectedUnit = noone;
selectMode = false;
paused = false;
with(Par_player){
	if(selected) Game_Camera.selectedUnit = self;
}

// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 1400;
view_hport[0] = 700;

camera_width = 1400
camera_height = 700
view_camera[0] = camera_create_view(selectedUnit.x-camera_width/2, selectedUnit.y-camera_height/2, camera_width, camera_height, 0, selectedUnit, 20, 20, camera_width, camera_height);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 480;
var _ypos = (_dheight / 2) - 270;
window_set_rectangle(_xpos, _ypos, 1400, 700);
surface_resize(application_surface, 1400, 700);

//Zoom
zoom_level = 1;
zoom_rate = 0.25;

//UI
global.showAdvancedInfo = false;