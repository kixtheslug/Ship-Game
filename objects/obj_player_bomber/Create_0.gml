/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.bomber_moveSpeed;
rotatespd = Game_ListHandler.bomber_turnSpeed;
dashspd = Game_ListHandler.bomber_dashSpeed;
speedCp = Game_ListHandler.bomber_speedCap;

//health
maxhp = Game_ListHandler.bomber_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.bomber_weaponType;

//skill
skill = Game_ListHandler.bomber_skill;

//AI
viewRad = Game_ListHandler.bomber_viewRad;