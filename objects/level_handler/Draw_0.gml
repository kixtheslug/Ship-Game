/// @description Draw Boundary and Background
if(showBorder){
	draw_set_colour(c_orange);
	draw_set_alpha(1);
	for (var i = 0; i < 10; i += 0.5) draw_rectangle(padding-i, padding-i, width+i, height+i, 1);
}

//background
if(room == Menu) draw_sprite_ext(planet,0,planetPosX,planetPosY,planetScale,planetScale,0,c_white,0.75);

//asteroids
layer_x("Ast_Near", Game_Camera.cameraX*.9);
layer_y("Ast_Near", Game_Camera.cameraY*.9);

layer_x("Ast_Mid",Game_Camera.cameraX*.92);
layer_y("Ast_Mid", Game_Camera.cameraY*.92);

layer_x("Ast_Far", Game_Camera.cameraX*.98);
layer_y("Ast_Far", Game_Camera.cameraY*.98);

//stars
layer_x("Star_Near", Game_Camera.cameraX*.8);
layer_y("Star_Near", Game_Camera.cameraY*.8);

layer_x("Star_Mid",Game_Camera.cameraX*.82);
layer_y("Star_Mid", Game_Camera.cameraY*.82);

layer_x("Star_Far", Game_Camera.cameraX*.88);
layer_y("Star_Far", Game_Camera.cameraY*.88);

/*layer_x(stars_layer, camera_get_view_x(view_camera[0])-10);
layer_y(stars_layer, camera_get_view_y(view_camera[0])-10);
	
var parallaxSpeed = 5;
planets_layX = layer_get_x(planets_layer)
if(planets_layX<camera_get_view_x(view_camera[0])) layer_x(planets_layer, planets_layX+parallaxSpeed);
else if (planets_layX>camera_get_view_x(view_camera[0])) layer_x(planets_layer, planets_layX-parallaxSpeed);

planets_layY = layer_get_y(planets_layer)
if(planets_layY<camera_get_view_y(view_camera[0])) layer_y(planets_layer, planets_layY+parallaxSpeed);
else if (planets_layY>camera_get_view_y(view_camera[0])) layer_y(planets_layer, planets_layY-parallaxSpeed);
*/