/// @description Initialize boundary

padding = 200;

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