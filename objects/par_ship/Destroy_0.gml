if(selected && playerUnit){
	var newUnit = instance_nearest(Game_Camera.x,Game_Camera.y,Par_player);	
	Game_Camera.selectedUnit = newUnit;
	newUnit.selected = true;
}