/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.assault_moveSpeed;
rotatespd = Game_ListHandler.assault_turnSpeed;
dashspd = Game_ListHandler.assault_dashSpeed;
speedCp = Game_ListHandler.assault_speedCap;

//health
maxhp = Game_ListHandler.assault_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.assault_weaponType;

//AI
viewRad = Game_ListHandler.assault_viewRad