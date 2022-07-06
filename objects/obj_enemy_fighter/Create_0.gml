/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.fighter_moveSpeed;
rotatespd = Game_ListHandler.fighter_turnSpeed;
dashspd = Game_ListHandler.fighter_dashSpeed;
speedCp = Game_ListHandler.fighter_speedCap;

//health
maxhp = Game_ListHandler.fighter_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.fighter_weaponType;

//AI
viewRad = Game_ListHandler.fighter_viewRad;