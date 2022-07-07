/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.utility_moveSpeed;
rotatespd = Game_ListHandler.utility_turnSpeed;
dashspd = Game_ListHandler.utility_dashSpeed;
speedCp = Game_ListHandler.utility_speedCap;

//health
maxhp = Game_ListHandler.utility_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.utility_weaponType;

//AI
skill = Game_ListHandler.utility_skill;
viewRad = Game_ListHandler.utility_viewRad
support = true