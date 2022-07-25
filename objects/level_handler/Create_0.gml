/// @description Initialize boundary

//change these per level
areaType = Game_ListHandler.tileTypes.Nothing;
areaWidth = 8000;
areaHeight = 8000;
shape = "Square";
team = Game_ListHandler.teamList.none;

switch (shape){
	case "Square":
		width = room_width-padding;
		height = room_height-padding;
		break;
	default:
		break;
}

//for menu
menu_NumberPlayer = 5;
menu_NumberEnemy = 5;
menu_NumberAsteroid = 25;
menu_NumberIce = 4;