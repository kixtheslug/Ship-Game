function Weapon_MissileFront(origin, dir, isEnemy){
	if(canShoot){
		bullet = instance_create_layer(x,y,"Projectiles", obj_proj_missile);
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
	
	if(canShootSec){
		for(var i = -1; i < Game_ListHandler.missilearray_shots; i+=2){
			bullet = instance_create_layer(x,y,"Projectiles", obj_proj_bullet);
			bullet.direction = dir+90*i;
			bullet.image_angle = dir+90*i;
			bullet.speed = Game_ListHandler.missilefront_sec_speed;
			bullet.owner = self
			bullet.team = team
			bullet.damage = Game_ListHandler.missilefront_sec_damage;
		}
		
		
		
		
		with(bullet) motion_add(other.image_angle,other.speed);
		canShootSec = false //reset shooting timer
		if(!isEnemy) origin.alarm[1] = room_speed*Game_ListHandler.missilefront_sec_reload;
		else origin.alarm[1] = room_speed*Game_ListHandler.missilefront_sec_reload*random_range(0.8,1.2);
	}
}