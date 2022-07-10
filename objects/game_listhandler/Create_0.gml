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

enum skills {
	None = 0,
	Dash = 1
}

/*
//////////////////////////////////////////////
BACKGROUNDS
//////////////////////////////////////////////
*/

backgroundList_planets = [
bg_planet_gas1,
bg_planet_gas2,
bg_planet_gas3,
bg_planet_gas4,
bg_planet_gas5,
bg_planet_gas6,
bg_planet_gas7,
bg_planet_gas8,
bg_planet_gas9,
bg_planet_rings1,
bg_planet_rings2,
bg_planet_rings3,
bg_planet_terr1
]

/*
//////////////////////////////////////////////
WEAPONS
//////////////////////////////////////////////
*/
enum weaponList{
	none = 0,
	peashooter = 1,
	missilearray = 2,
	missilefront = 3,
	gatling = 4
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

missilefront_sec_speed = 20;
missilefront_sec_damage = 5;
missilefront_sec_reload = 0.25;
missilearray_sec_shots = 2;

//Gatling
gatling_speed = 30;
gatling_damage = 5;
gatling_reload = 0.1;

/*
//////////////////////////////////////////////
SHIPS
//////////////////////////////////////////////
*/
enum shipList{
	satellite = 0,
	fighter = 1,
	destroyer = 2,
	assault = 3,
	scout = 4,
	utility = 5
}

//satellite
satellite_moveSpeed = 0;
satellite_turnSpeed = 3;
satellite_dashSpeed = 0;
satellite_speedCap = 0;
satellite_maxHP = 100;
satellite_weaponType = weaponList.gatling;
satellite_viewRad = 2000;
satellite_skill = skills.None;

//Fighter
fighter_moveSpeed = 0.2;
fighter_turnSpeed = 3;
fighter_dashSpeed = 1;
fighter_speedCap = 6;
fighter_maxHP = 50;
fighter_weaponType = weaponList.peashooter;
fighter_viewRad = 1200;
fighter_skill = skills.Dash;

//Destroyer
destroyer_moveSpeed = 0.07;
destroyer_turnSpeed = 1;
destroyer_dashSpeed = 1;
destroyer_speedCap = 3;
destroyer_maxHP = 125;
destroyer_weaponType = weaponList.missilearray;
destroyer_viewRad = 1000;
destroyer_skill = skills.Dash;

//Assault
assault_moveSpeed = 0.07;
assault_turnSpeed = 0.3;
assault_dashSpeed = 1;
assault_speedCap = 4.5;
assault_maxHP = 125;
assault_weaponType = weaponList.missilefront;
assault_viewRad = 1350;
assault_skill = skills.Dash;

//Scout
scout_moveSpeed = 0.8;
scout_turnSpeed = 5;
scout_dashSpeed = 2;
scout_speedCap = 12;
scout_maxHP = 20;
scout_weaponType = weaponList.gatling;
scout_viewRad = 2000;
scout_skill = skills.Dash;

//Utility
utility_moveSpeed = 0.5;
utility_turnSpeed = 5;
utility_dashSpeed = 1;
utility_speedCap = 6;
utility_maxHP = 75;
utility_weaponType = weaponList.none;
utility_viewRad = 800;
utility_skill = skills.Dash;