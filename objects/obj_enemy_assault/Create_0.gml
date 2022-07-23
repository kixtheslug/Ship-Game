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

//skill
skill = Game_ListHandler.assault_skill;
skillMaxDuration = Game_ListHandler.assault_skill_duration*room_speed;
skillDuration = skillMaxDuration;
skillRegen = Game_ListHandler.assault_skill_regen;

//AI
viewRad = Game_ListHandler.assault_viewRad;
rangeRad = viewRad+100