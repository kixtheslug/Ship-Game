/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.satellite_moveSpeed;
rotatespd = Game_ListHandler.satellite_turnSpeed;
dashspd = Game_ListHandler.satellite_dashSpeed;
speedCp = Game_ListHandler.satellite_speedCap;

//health
maxhp = Game_ListHandler.satellite_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.satellite_weaponType;

//AI
skill = Game_ListHandler.satellite_skill;
viewRad = Game_ListHandler.satellite_viewRad
stationary = true;