/// @description Randomized background and resources
var planlen = array_length(Game_ListHandler.backgroundList_planets)-1;
planet = Game_ListHandler.backgroundList_planets[irandom_range(0,planlen)];

planetScale = random_range(1,3);
planetPosX = random_range(sprite_get_width(planet),room_width-sprite_get_width(planet));
planetPosY = random_range(sprite_get_height(planet),room_height-sprite_get_height(planet));
//planetSize = sprite_get_width(planet)*planetScale;

/*stars_layer = layer_create(10000);
stars_near = layer_background_create(stars_layer, bg_back_star_near);
layer_background_htiled(stars_near, true);
layer_background_vtiled(stars_near, true);

stars_mid = layer_background_create(stars_layer, bg_back_star_mid);
layer_background_htiled(stars_mid, true);
layer_background_vtiled(stars_mid, true);

stars_far = layer_background_create(stars_layer, bg_back_star_far);
layer_background_htiled(stars_far, true);
layer_background_vtiled(stars_far, true);*/
if(room!=Menu){
	/*----------------------
		REGULAR LEVELS
	----------------------*/
	
	//SPAWN ASTEROIDS
	var numberAsteroids = irandom_range(20,50);
	for(var i = 0; i < numberAsteroids; i++){
		astX = -1
		astY = -1
		validSpawn = true;
	
		while (astX == -1 && astY == -1){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
		}
	
		with(Level_Safezone){
			if(Level_Handler.astX>x && Level_Handler.astX<x+zoneWidth) || (Level_Handler.astY>y && Level_Handler.astY<y+zoneHeight){
				Level_Handler.validSpawn = false;
			}
		}
	
		if(validSpawn) instance_create_layer(astX,astY,"Objects",obj_asteroid);
		else i--;
	}

	//SPAWN ICE
	var numberIce = irandom_range(5,10);
	for(var i = 0; i < numberIce; i++){
		astX = -1
		astY = -1
		validSpawn = true;
	
		while (astX == -1 && astY == -1){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
		}
	
		with(Level_Safezone){
			if(Level_Handler.astX>x && Level_Handler.astX<x+zoneWidth) || (Level_Handler.astY>y && Level_Handler.astY<y+zoneHeight){
				Level_Handler.validSpawn = false;
			}
		}
	
		if(validSpawn) instance_create_layer(astX,astY,"Objects",obj_ice);
		else i--;
	}
	
	
} else{ //if menu, create ships
	/*----------------------
		MAIN MENU
	----------------------*/
	
	//SPAWN ASTEROIDS
	for(var i = 0; i < menu_NumberAsteroid; i++){
		astX = -1
		astY = -1
		validSpawn = true;
	
		while (astX == -1 && astY == -1){
			astX = irandom_range(20,room_width-20)
			astY = irandom_range(20,room_height-20)
		}
	
		with(Level_Safezone){
			if(Level_Handler.astX>x && Level_Handler.astX<x+zoneWidth) || (Level_Handler.astY>y && Level_Handler.astY<y+zoneHeight){
				Level_Handler.validSpawn = false;
			}
		}
	
		if(validSpawn) instance_create_layer(astX,astY,"Objects",obj_asteroid);
		else i--;
	}
	
	//SPAWN ICE
	for(var i = 0; i < menu_NumberIce; i++){
		astX = -1
		astY = -1
		validSpawn = true;
	
		while (astX == -1 && astY == -1){
			astX = irandom_range(20,room_width-20)
			astY = irandom_range(20,room_height-20)
		}
	
		with(Level_Safezone){
			if(Level_Handler.astX>x && Level_Handler.astX<x+zoneWidth) || (Level_Handler.astY>y && Level_Handler.astY<y+zoneHeight){
				Level_Handler.validSpawn = false;
			}
		}
	
		if(validSpawn) instance_create_layer(astX,astY,"Objects",obj_ice);
		else i--;
	}
	
	//SPAWN PLAYERS
	for(var i = 0; i < menu_NumberPlayer; i++){
		astX = -1
		astY = -1
		validSpawn = true; //no condition it can be invalid currently
	
		while (astX == -1 && astY == -1){
			astX = irandom_range(20,room_width-20)
			astY = irandom_range(20,room_height-20)
		}

		if(validSpawn) instance_create_layer(astX,astY,"Entities",obj_player_fighter);
		else i--;
	}

	//SPAWN ENEMIES
	for(var i = 0; i < menu_NumberEnemy; i++){
		astX = -1
		astY = -1
		validSpawn = true; //no condition it can be invalid currently
	
		while (astX == -1 && astY == -1){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
		}
	
		if(validSpawn) instance_create_layer(astX,astY,"Entities",obj_enemy_fighter);
		else i--;
	}
}