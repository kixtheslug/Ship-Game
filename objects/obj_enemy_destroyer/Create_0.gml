/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.destroyer_moveSpeed;
rotatespd = Game_ListHandler.destroyer_turnSpeed;
dashspd = Game_ListHandler.destroyer_dashSpeed;
speedCp = Game_ListHandler.destroyer_speedCap;

//health
maxhp = Game_ListHandler.destroyer_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.destroyer_weaponType;

//AI
viewRad = Game_ListHandler.destroyer_viewRad;