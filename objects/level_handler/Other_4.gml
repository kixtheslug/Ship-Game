/// @description Randomized background and resources
if(room != Level_Select){
	if(room != Menu){
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
}