/// @description Draw the map
draw_set_color(c_white);
for(var r = 0; r < rowNumber; r++){ //fill array
	for(var c = 0; c < colNumber; c++){
		var posX = tileGridX+tileGridBuffer*r;
		var posY = tileGridY+tileGridBuffer*c;
		var area = levelMap[r][c];
		
		switch(area.areaType){
			case Game_ListHandler.tileTypes.Nothing:
				break;
			
			case Game_ListHandler.tileTypes.Space:
				draw_sprite(UI_tile_space,2, posX, posY);
				typeString = "Abyss"
				break;
			
			case Game_ListHandler.tileTypes.Asteroid:
				draw_sprite(UI_tile_asteroids,2, posX, posY);
				typeString = "Asteroids"
				break;
				
			default:
				break;
		}
		
		//draw border
		if(area.areaType != Game_ListHandler.tileTypes.Nothing) draw_sprite(UI_tile_border, area.team, posX, posY);
		
		switch(area.team){
			case Game_ListHandler.teamList.none:
				typeColor=c_white; typeTeam="Undiscovered"; break;
			case Game_ListHandler.teamList.player:
				typeColor=c_lime; typeTeam="Allied"; break;
			case Game_ListHandler.teamList.hostile:
				typeColor=c_red; typeTeam="Hostile"; break;
			case Game_ListHandler.teamList.neutral:
				typeColor=c_yellow; typeTeam="Neutral"; break;
				
			default: break;
		}
		
		if(mouse_x>posX-tileSize/2 && mouse_x<posX+tileSize/2 && mouse_y>posY-tileSize/2 && mouse_y<posY+tileSize/2 && area.areaType != Game_ListHandler.tileTypes.Nothing){
			draw_sprite_ext(UI_tile_selected,2, posX, posY,1,1,0,c_white,0.5);
			
			draw_set_color(c_grey);
			draw_rectangle(0,0,room_width,125,0);
			
			draw_set_color(c_white);
			draw_set_font(fnt_pixel_large);
			draw_set_halign(fa_center);
			draw_text(room_width/2,5,"Area Information");
			
			var textX = 50;
			var textY = 20;
			var textBuffer = 30;
			draw_set_font(fnt_pixel_medium);
			draw_set_halign(fa_left);
			draw_text(textX,textY,"Area Type: " + typeString);
			draw_text(textX,textY+textBuffer,"Area Size: ");
			draw_text(textX,textY+textBuffer*2,"Area Shape: Square");
			
			var textX = room_width-50;
			var textY = 20;
			var textBuffer = 30;
			draw_set_font(fnt_pixel_large);
			draw_set_halign(fa_right);
			draw_set_color(typeColor);
			draw_text(textX,textY,typeTeam); //who controlls it
			
			if(mouse_check_button_pressed(mb_left)){
				room = Test_map;	
			}
		}
	}
}