function Weapon_Beam(origin, dir, isEnemy){
	if(canShoot){
		//motion_add(image_angle, -Game_ListHandler.peashooter_recoil);//recoil
		canShoot = false //reset shooting timer
		weapon_duration = Game_ListHandler.beam_duration;
		origin.alarm[0] = room_speed*Game_ListHandler.beam_reload + Game_ListHandler.beam_duration;
	}
}