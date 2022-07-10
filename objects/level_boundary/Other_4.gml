/// @description Randomized background
var len = array_length(Game_ListHandler.backgroundList_planets)-1;
planet = Game_ListHandler.backgroundList_planets[irandom_range(0,len)];

planetScale = random_range(4,9);
planetRot = random_range(0,360);
planetPosX = random_range(sprite_get_width(planet),room_width-sprite_get_width(planet));
planetPosY = random_range(sprite_get_height(planet),room_height-sprite_get_height(planet));