function Weapon_Peashooter(origin, dir, isEnemy){
	if(canShoot){
		//motion_add(image_angle, -Game_ListHandler.peashooter_recoil);//recoil
		
		bullet = instance_create_layer(x,y,"Projectiles", obj_proj_laser);
		bullet.direction = dir;
		bullet.image_angle = dir;
		bullet.speed = Game_ListHandler.peashooter_speed;
		bullet.owner = self
		bullet.team = team
		bullet.damage = Game_ListHandler.peashooter_damage;
		canShoot = false //reset shooting timer
		if(!isEnemy) origin.alarm[0] = room_speed*Game_ListHandler.peashooter_reload;
		else origin.alarm[0] = room_speed*Game_ListHandler.peashooter_reload*random_range(0.8,1.2);
	}
}