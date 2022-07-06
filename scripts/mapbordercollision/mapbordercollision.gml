function MapBorderCollision(){
	//default square is (116, 116) to (1876, 1876)
	if(x<Level_Boundary.padding) x = Level_Boundary.padding
	if(y<Level_Boundary.padding) y = Level_Boundary.padding
	
	if(x>Level_Boundary.width) x = Level_Boundary.width
	if(y>Level_Boundary.height) y = Level_Boundary.height
}