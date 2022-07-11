/// @description Initialize boundary

//change these per level
shapes_list = ["Square"];
shape = shapes_list[0];

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