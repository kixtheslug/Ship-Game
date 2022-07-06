if(selected){
	var newUnit = instance_nearest(xprevious,yprevious,Par_player);	
	Game_Camera.selectedUnit = newUnit;
	newUnit.selected = true;
}