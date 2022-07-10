event_inherited();

//stats - uses fighter stats by default
movespd = Game_ListHandler.fighter_moveSpeed;
rotatespd = Game_ListHandler.fighter_turnSpeed;
dashspd = Game_ListHandler.fighter_dashSpeed;
speedCp = Game_ListHandler.fighter_speedCap;
maxhp = Game_ListHandler.fighter_maxHP;
hp = maxhp;
viewRad = Game_ListHandler.fighter_viewRad;
rangeRad = viewRad+100; //considers itself in the player's "range" even if it can't see you

//control
moving = false;
speedCp = 6;
damp = true;
dashing = false;
lostControl = false;
cloaked = false;

//weapons
weaponType = Game_ListHandler.weaponList.peashooter;
canShoot = true;
canShootSec = true; //for secondary weapons if it has those
lastSide = 0; //for weapons that fire out of alternating sides

//AI
skill = Game_ListHandler.fighter_skill;
support = false;
stationary = false;
team = Game_ListHandler.teamList.hostile;
currentMode = Game_ListHandler.AImodes.Idle;
AIEnabled = true;
canSeeTarget = false;
canShoot = true;
alert = false;
hasRoute = false;
if(instance_exists(Par_ship)) target = instance_nearest(x,y,Par_ship); //this needs to change dynamically

idleX = x; //remembers the last position it was in when idle
idleY = y;
wantsToReturn = true; //if the enemy wants to return to its last position
satisfiedRad = 50; //range its satisfied its returned to its last position or has explored an area

angleToExplore = random_range(0,359);
distanceToExplore = random_range(90,90);
exploreX = x + lengthdir_x(distanceToExplore, angleToExplore);
exploreY = y + lengthdir_y(distanceToExplore, angleToExplore);

//built in var
image_speed = 0;
speed = 0;

/*----PARTICLES----*/
//Jetstream particles
PEmitter_JetStream = part_emitter_create(global.P_System);
Part_JetStream = part_type_create();
part_type_shape(Part_JetStream, pt_shape_disk);
part_type_size(Part_JetStream, 0.1, 0.1, -0.01, .01);
part_type_color1(Part_JetStream, c_white);
part_type_alpha3(Part_JetStream, 1, 0.5, 0);
part_type_life(Part_JetStream, 20, 20);
part_type_direction(Part_JetStream, image_angle-5, image_angle+5, 0, 0);
part_type_speed(Part_JetStream, 2, 2, -0.50, 0);

//Dash particles
PEmitter_Dash = part_emitter_create(global.P_System);
Part_Dash = part_type_create();
part_type_shape(Part_Dash, pt_shape_line);
part_type_size(Part_Dash, 0.1, 0.1, -0.01, .01);
part_type_color1(Part_Dash, c_white);
part_type_alpha3(Part_Dash, 1, 0.5, 0);
part_type_life(Part_Dash, 20, 20);
part_type_direction(Part_Dash, image_angle, image_angle, 0, 0);
part_type_orientation(Part_Dash, image_angle, image_angle, 0, 0, 0);
part_type_speed(Part_Dash, 2, 2, -0.50, 0);