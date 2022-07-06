function Weapon_MissileFront(origin, dir, isEnemy){
	if(canShoot){
		bullet = instance_create_layer(x,y,"Objects", obj_proj_missile);
		bullet.direction = dir;
		bullet.image_angle = dir;
		bullet.speed = Game_ListHandler.missilefront_speed;
		bullet.owner = self
		bullet.team = team
		bullet.damage = Game_ListHandler.missilefront_damage;
		with(bullet) motion_add(other.image_angle,other.speed);
		canShoot = false //reset shooting timer
		if(!isEnemy) origin.alarm[0] = room_speed*Game_ListHandler.missilefront_reload;
		else origin.alarm[0] = room_speed*Game_ListHandler.missilefront_reload*random_range(0.8,1.2);
	}
}