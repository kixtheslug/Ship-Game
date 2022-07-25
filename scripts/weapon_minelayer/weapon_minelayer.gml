function Weapon_Minelayer(origin, dir, isEnemy){
	if(canShoot){
		bullet = instance_create_layer(x,y,"Projectiles", obj_proj_mine);
		bullet.direction = dir;
		bullet.image_angle = dir;
		bullet.owner = self
		bullet.team = team
		bullet.damage = Game_ListHandler.minelayer_damage;
		bullet.hp = Game_ListHandler.minelayer_health;
		bullet.alarm[0] = Game_ListHandler.minelayer_duration;
		with(bullet) motion_add(other.image_angle,other.speed);
		canShoot = false //reset shooting timer
		if(!isEnemy) origin.alarm[0] = room_speed*Game_ListHandler.minelayer_reload;
		else origin.alarm[0] = room_speed*Game_ListHandler.minelayer_reload*random_range(0.8,1.2);
	}
}