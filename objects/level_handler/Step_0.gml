/// @description Respawn ships
if(room != Level_Select){
	if(room == Menu){
		if(instance_number(Par_player)<menu_NumberPlayer){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
			instance_create_layer(astX,astY,"Entities",obj_player_fighter);
		}
	
		if(instance_number(Par_enemy)<menu_NumberEnemy){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
			instance_create_layer(astX,astY,"Entities",obj_enemy_fighter);
		}
	
		if(instance_number(obj_asteroid)<menu_NumberAsteroid){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
			instance_create_layer(astX,astY,"Objects",obj_asteroid);
		}
	
		if(instance_number(obj_ice)<menu_NumberIce){
			astX = irandom_range(padding+20,room_width-padding-20)
			astY = irandom_range(padding+20,room_height-padding-20)
			instance_create_layer(astX,astY,"Objects",obj_ice);
		}
	}
}