// Shoot bullets
function ActivateWeapon(origin, dir, isEnemy){
	switch(weaponType){
		case Game_ListHandler.weaponList.peashooter:
			Weapon_Peashooter(origin, dir, isEnemy);
			break;
		case Game_ListHandler.weaponList.missilearray:
			Weapon_MissileArray(origin, dir, isEnemy);
			break;
		case Game_ListHandler.weaponList.missilefront:
			Weapon_MissileFront(origin, dir, isEnemy);
			break;
		case Game_ListHandler.weaponList.gatling:
			Weapon_Gatling(origin, dir, isEnemy);
			break;
		case Game_ListHandler.weaponList.none:
			break;
		default:
			break;
	}
}