//control team management
if(playerUnit){
	team = Game_ListHandler.teamList.player
	if(instance_exists(Par_enemy)) target = instance_nearest(x,y,Par_enemy);
} else if(instance_exists(Par_player)) target = instance_nearest(x,y,Par_player);

if(!Game_Camera.paused && !Game_Camera.selectMode){ //dont work if paused
	if(lostControl){
		image_angle+=rotatespd;
		moving = false;
		dashing = false;
	}
	
	if(playerUnit && selected){ //MANUAL CONTROLS
		//directional movement
		if(!dashing && !lostControl){
			if(smartTarget == noone){ //move normally with rotation
				if (keyboard_check(ord("W"))){ //move up
					motion_add(image_angle, movespd);
					moving = true;
				}
				if (keyboard_check(ord("Q"))){ //strafe left
					motion_add(image_angle+90, movespd);
					moving = true;
				}
				if (keyboard_check(ord("E"))){ //strafe right
					motion_add(image_angle-90, movespd);
					moving = true;
				}
				if (keyboard_check(ord("S"))){ //reverse
					motion_add(image_angle, -movespd);
					moving = true;
				}
				//rotation
				if (keyboard_check(ord("A"))){ //rotate left
					image_angle += rotatespd
				}
				if (keyboard_check(ord("D"))){ //rotate right
					image_angle -= rotatespd
				}
				
				if (keyboard_check_pressed(ord("T"))){
					var potentialTarget = instance_nearest(x,y,Par_enemy);
					if(distance_to_object(potentialTarget) <= viewRad){
						smartTarget = potentialTarget; //select smart target
					} else{
						messageNoTarget = true;
						alarm[3] = messageTime;
					}
				}
			
			} else if (instance_exists(smartTarget)){ //move with WASD and always rotate towards the target
				//RotateToTarget(self, smartTarget, rotatespd, 1);
				image_angle = point_direction(x, y, smartTarget.x, smartTarget.y);
				
				if (keyboard_check_pressed(ord("T"))) smartTarget = noone; //clear smart target
				
				if (keyboard_check(ord("W"))){ //move up
					motion_add(image_angle, movespd);
					moving = true;
				}
				if (keyboard_check(ord("A"))){ //strafe left
					motion_add(image_angle+90, movespd);
					moving = true;
				}
				if (keyboard_check(ord("D"))){ //strafe right
					motion_add(image_angle-90, movespd);
					moving = true;
				}
				if (keyboard_check(ord("S"))){ //reverse
					motion_add(image_angle, -movespd);
					moving = true;
				}
			} else smartTarget = noone; //for when the target dies
		}

		//skills
		if (keyboard_check(vk_shift) && !lostControl && canUseSkill){
			switch (skill){
				case Game_ListHandler.skills.Dash:
					if(skillDuration>0){
						dashing = true
						skillDuration--;
					} else canUseSkill = false;
					break;
					
				case Game_ListHandler.skills.Cloak:
					if(skillDuration>0){
						cloaked = true
						skillDuration--;
					} else canUseSkill = false;
					break;
					
				case Game_ListHandler.skills.None:
					break;
					
				default:
					break;
			}
		} else {
			dashing = false
			cloaked = false
			if(skillDuration<skillMaxDuration) skillDuration += skillRegen;
			else if (skillDuration> skillMaxDuration) skillDuration = skillMaxDuration //make sure there cant be overflow
			else canUseSkill = true //only runs if skillDuration = skillMaxDuration
		}
		if (dashing) {
			motion_add(image_angle, dashspd);
			part_emitter_region(global.P_System, PEmitter_Dash, x+15, x-15, y+15, y-15, ps_shape_rectangle, ps_distr_linear);
			part_emitter_stream(global.P_System, PEmitter_Dash, Part_Dash, 1);
		} else part_emitter_clear(global.P_System, PEmitter_Dash);

		//cap speed and decelerate
		if (keyboard_check_pressed(ord("F"))){ //toggle dampening
			if (damp) damp = false;
			else damp = true;
		}

		//create jetstream
		if (!keyboard_check(ord("W")) && !keyboard_check(ord("Q")) && !keyboard_check(ord("E")) && !keyboard_check(ord("S"))) moving = false;
		if(moving && !dashing){
			part_emitter_region(global.P_System, PEmitter_JetStream, x, x, y, y, ps_shape_ellipse, ps_distr_linear);
			part_emitter_stream(global.P_System, PEmitter_JetStream, Part_JetStream, 1);
		} else part_emitter_clear(global.P_System, PEmitter_JetStream);
		//part_particles_create(global.P_System, x, y, global.Part_JetStream, 1);

		//shoot
		if (keyboard_check(vk_space) && !lostControl){ //rotate left
			ActivateWeapon(self, image_angle, false);
		}

		/*----PARTICLES----*/
		//direction of jetstream
		var jet_angle = 180+image_angle
		part_type_direction(Part_JetStream, jet_angle-5, jet_angle+5, 0, 0);
		//direction of dash
		part_type_direction(Part_Dash, image_angle, image_angle, 0, 0);
		part_type_orientation(Part_Dash, image_angle, image_angle, 0, 0, 0);
	}
	
	if(AIEnabled && !selected){ //AI CONTROLS
		//detect target
		distanceToPlayer = distance_to_object(target);
		if(distanceToPlayer<=viewRad){
			canSeeTarget = true;
		} else canSeeTarget = false;

		//AI
		if(!stationary && !support){
			if(hp<=maxhp/4){ //check for low health
				if(distanceToPlayer<=rangeRad) currentMode = Game_ListHandler.AImodes.Flee; //if in player range will flee
				else currentMode = Game_ListHandler.AImodes.Idle; //otherwise turns idle but still avoids combat
			}
			else if (canSeeTarget) currentMode = Game_ListHandler.AImodes.Chase; //if above low health will engage
			else if (alert) currentMode = Game_ListHandler.AImodes.Alert; //enter alert mode
			else currentMode = Game_ListHandler.AImodes.Idle; //if nothing else is detected, goes to idle

			//switch AI modes
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
		}else if(stationary){ //if stationary use turret aim code
			if(distance_to_object(target) <= viewRad){
				RotateToTarget(self, target, rotatespd, 1);
				ActivateWeapon(self, direction, true);
				image_angle = direction;
			}
		}
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
if (damp) speed = max(speed-0.05,0)

//lock to gamemap
MapBorderCollision();