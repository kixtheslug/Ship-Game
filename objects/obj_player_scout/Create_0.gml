/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.scout_moveSpeed;
rotatespd = Game_ListHandler.scout_turnSpeed;
dashspd = Game_ListHandler.scout_dashSpeed;
speedCp = Game_ListHandler.scout_speedCap;

//health
maxhp = Game_ListHandler.scout_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.scout_weaponType;

//AI
skill = Game_ListHandler.scout_skill;
viewRad = Game_ListHandler.scout_viewRad