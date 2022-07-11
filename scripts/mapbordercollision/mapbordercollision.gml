function MapBorderCollision(){
	//default square is (116, 116) to (1876, 1876)
	if(x<Level_Handler.padding) x = Level_Handler.padding
	if(y<Level_Handler.padding) y = Level_Handler.padding
	
	if(x>Level_Handler.width) x = Level_Handler.width
	if(y>Level_Handler.height) y = Level_Handler.height
}