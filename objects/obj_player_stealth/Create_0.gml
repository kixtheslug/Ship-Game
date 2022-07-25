/// @description Inherit stats and change some
event_inherited();

//movement
movespd = Game_ListHandler.stealth_moveSpeed;
rotatespd = Game_ListHandler.stealth_turnSpeed;
dashspd = Game_ListHandler.stealth_dashSpeed;
speedCp = Game_ListHandler.stealth_speedCap;

//health
maxhp = Game_ListHandler.stealth_maxHP;
hp = maxhp;

//weapons
weaponType = Game_ListHandler.stealth_weaponType;

//skill
skill = Game_ListHandler.stealth_skill;
skillMaxDuration = Game_ListHandler.stealth_skill_duration*room_speed;
skillDuration = skillMaxDuration;
skillRegen = Game_ListHandler.stealth_skill_regen;

//AI
viewRad = Game_ListHandler.stealth_viewRad;