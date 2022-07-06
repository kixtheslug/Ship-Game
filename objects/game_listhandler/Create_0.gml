/// @description Initialize lists
enum teamList{
	none = 0,
	player = 1, //player
	hostile = 2, //enemy
	neutral = 3
}

enum AImodes {
	Idle = 0,
	Alert = 1,
	Chase = 2,
	Flee = 3
}

/*
//////////////////////////////////////////////
WEAPONS
//////////////////////////////////////////////
*/
enum weaponList{
	peashooter = 0,
	missilearray = 1,
	missilefront = 2
}

//Peashooter
peashooter_speed = 20;
peashooter_damage = 10;
peashooter_reload = 0.5;

//Missile Array
missilearray_speed = 2;
missilearray_damage = 7;
missilearray_reload = 2;
missilearray_shots = 3;

//Assault Battery
missilefront_speed = 2;
missilefront_damage = 7;
missilefront_reload = 1.5;

/*
//////////////////////////////////////////////
SHIPS
//////////////////////////////////////////////
*/
enum shipList{
	fighter = 0,
	destroyer = 1,
	assault = 2,
	scout = 3,
	utility = 4
}

//Fighter
fighter_moveSpeed = 0.2;
fighter_turnSpeed = 3;
fighter_dashSpeed = 1;
fighter_speedCap = 6;
fighter_maxHP = 50;
fighter_weaponType = weaponList.peashooter;
fighter_viewRad = 1200;

//Destroyer
destroyer_moveSpeed = 0.07;
destroyer_turnSpeed = 1;
destroyer_dashSpeed = 1;
destroyer_speedCap = 3;
destroyer_maxHP = 125;
destroyer_weaponType = weaponList.missilearray;
destroyer_viewRad = 1000;

//Assault
assault_moveSpeed = 0.07;
assault_turnSpeed = 0.3;
assault_dashSpeed = 1;
assault_speedCap = 4.5;
assault_maxHP = 125;
assault_weaponType = weaponList.missilefront;
assault_viewRad = 1350;

//Scout
scout_moveSpeed = 0.8;
scout_turnSpeed = 5;
scout_dashSpeed = 2;
scout_speedCap = 12;
scout_maxHP = 10;
scout_weaponType = weaponList.peashooter;
scout_viewRad = 2000;