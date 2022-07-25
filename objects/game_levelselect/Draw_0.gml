/// @description Draw connections
draw_set_color(c_white);
for(var r = 0; r < rowNumber; r++){ //fill array
	for(var c = 0; c < colNumber; c++){
		var posX = tileGridX+tileGridBuffer*r;
		var posY = tileGridY+tileGridBuffer*c;
		
		if(levelMap[r][c].areaType != Game_ListHandler.tileTypes.Nothing) {
			//draw connections
			if(r+1<rowNumber && levelMap[r+1][c].areaType != Game_ListHandler.tileTypes.Nothing) draw_line_width(posX,posY,tileGridX+tileGridBuffer*(r+1),tileGridY+tileGridBuffer*c,connectionWidth);
			if(r-1>0 && levelMap[r-1][c].areaType != Game_ListHandler.tileTypes.Nothing) draw_line_width(posX,posY,tileGridX+tileGridBuffer*(r-1),tileGridY+tileGridBuffer*c,connectionWidth);
			if(c+1<colNumber && levelMap[r][c+1].areaType != Game_ListHandler.tileTypes.Nothing) draw_line_width(posX,posY,tileGridX+tileGridBuffer*r,tileGridY+tileGridBuffer*(c+1),connectionWidth);
			if(c-1>0 && levelMap[r][c-1].areaType != Game_ListHandler.tileTypes.Nothing) draw_line_width(posX,posY,tileGridX+tileGridBuffer*r,tileGridY+tileGridBuffer*(c-1),connectionWidth);
		}
	}
}