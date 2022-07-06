/// @description Initialize zone boundary

array_push(Game_ShipHandler.ListOfZones,self);

//change these per level
color = c_orange;

//create turrets
turret1 = instance_create_layer(x,y,"Entities",obj_turret);
turret1.zone = self;
turret2 = instance_create_layer(x+zoneWidth,y,"Entities",obj_turret);
turret2.zone = self;
turret3 = instance_create_layer(x,y+zoneHeight,"Entities",obj_turret);
turret3.zone = self;
turret4 = instance_create_layer(x+zoneWidth,y+zoneHeight,"Entities",obj_turret);
turret4.zone = self;