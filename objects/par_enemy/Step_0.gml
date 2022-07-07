if(!Game_Camera.paused && !Game_Camera.selectMode){ //dont work if paused
	if(lostControl){
		image_angle+=rotatespd;
		moving = false;
		dashing = false;
	}

	//detect player
	if(instance_exists(Par_player)) target = instance_nearest(x,y,Par_player);
	distanceToPlayer = distance_to_object(target);
	if(distanceToPlayer<=viewRad){
		canSeeTarget = true;
	} else canSeeTarget = false;

	//AI
	if(hp<=maxhp/4){ //check for low health
		if(distanceToPlayer<=rangeRad) currentMode = Game_ListHandler.AImodes.Flee; //if in player range will flee
		else currentMode = Game_ListHandler.AImodes.Idle; //otherwise turns idle but still avoids combat
	}
	else if (canSeeTarget) currentMode = Game_ListHandler.AImodes.Chase; //if above low health will engage
	else if (alert) currentMode = Game_ListHandler.AImodes.Alert; //enter alert mode
	else currentMode = Game_ListHandler.AImodes.Idle; //if nothing else is detected, goes to idle


	switch (currentMode){
		case Game_ListHandler.AImodes.Idle:
			Ship_IdleAI();
			break;
		
		case Game_ListHandler.AImodes.Alert:
			Ship_AlertAI();
			break;
		
		case Game_ListHandler.AImodes.Chase:
			Ship_ChaseAI();
			break;
		
		case Game_ListHandler.AImodes.Flee:
			Ship_FleeAI();
			break;
	
		default: //resorts to idle AI
			Ship_IdleAI();
			break;
	}

	/*----PARTICLES----*/
	//direction of jetstream
	var jet_angle = 180+image_angle
	part_type_direction(Part_JetStream, jet_angle-5, jet_angle+5, 0, 0);
	//direction of dash
	part_type_direction(Part_Dash, image_angle, image_angle, 0, 0);
	part_type_orientation(Part_Dash, image_angle, image_angle, 0, 0, 0);

	if(moving && !dashing){ //jetstream particles for moving
		part_emitter_region(global.P_System, PEmitter_JetStream, x, x, y, y, ps_shape_ellipse, ps_distr_linear);
		part_emitter_stream(global.P_System, PEmitter_JetStream, Part_JetStream, 1);
	} else part_emitter_clear(global.P_System, PEmitter_JetStream);

	if (dashing) { //particles for dashing
		motion_add(image_angle, dashspd);
		part_emitter_region(global.P_System, PEmitter_Dash, x+15, x-15, y+15, y-15, ps_shape_rectangle, ps_distr_linear);
		part_emitter_stream(global.P_System, PEmitter_Dash, Part_Dash, 1);
	} else part_emitter_clear(global.P_System, PEmitter_Dash);
}

//regular movement
if (speed > speedCp && !dashing) speed = speedCp;
else if (dashing) speed = speedCp*1.67; //dashing speed cap
speed = max(speed-0.05,0)

//lock to gamemap
MapBorderCollision();