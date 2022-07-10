function Weapon_MissileArray(origin, dir, isEnemy){
	if(canShoot){
		//motion_add(image_angle, -Game_ListHandler.peashooter_recoil);//recoil
		if(lastSide == 0){ //right
			side = 1;
			lastSide = 1;
		} else{ //left
			side = 0;
			lastSide = 0;
		}
		
		for(var i = 0; i < Game_ListHandler.missilearray_shots; i++){
			bullet = instance_create_layer(x,y,"Projectiles", obj_proj_missile);
			
			if(side == 0){ //right
				bullet.direction = dir+i*10+70;
				bullet.image_angle = dir+i*10+70;
			} else{ //left
				bullet.direction = dir+i*10-70;
				bullet.image_angle = dir+i*10-70;
			}
			bullet.speed = Game_ListHandler.missilearray_speed;
			bullet.owner = self
			bullet.team = team
			bullet.damage = Game_ListHandler.missilearray_damage;
			with(bullet) motion_add(other.image_angle,other.speed);
		}
		
		canShoot = false //reset shooting timer
		if(!isEnemy) origin.alarm[0] = room_speed*Game_ListHandler.missilearray_reload;
		else origin.alarm[0] = room_speed*Game_ListHandler.missilearray_reload*random_range(0.8,1.2);
	}
}