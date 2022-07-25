draw_set_alpha(1);
var enemy_outline_color = make_colour_rgb(255, 145, 145);

if(tetherTarget != noone && instance_exists(tetherTarget)){
	draw_set_alpha(0.5);
	draw_set_color(c_lime);
	
	draw_line_width(x,y,tetherTarget.x,tetherTarget.y,5);
	draw_sprite_ext(UI_tether,0,tetherTarget.x,tetherTarget.y,1,1,targetRot,c_white,1); //target reticule
	
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	with(tetherTarget) {
		if(hp<maxhp){
			hp += tetherHeal; //heal tethered unit
			part_emitter_region(global.P_System, PEmitter_Heal, x, x, y, y, ps_shape_ellipse, ps_distr_linear);
			part_emitter_stream(global.P_System, PEmitter_Heal, Part_Heal, 1);
		} else part_emitter_clear(global.P_System, PEmitter_Heal);
	}
}

if(room != Menu){
	if(!cloaked){
		if (AIEnabled && playerUnit && !selected) draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,c_lime,1); //green outline
		else if (!playerUnit) draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,enemy_outline_color,1); //enemy outline
		else draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,c_white,1); //normal outline
		draw_self();

		var currentHealth = (hp/maxhp)*100
		//controls healthbar color
		if (!invincible){
			if(playerUnit) draw_healthbar(x-10, y+15, x+10, y+20, currentHealth, c_white, c_green, c_green, 0, 1, 1);
			else draw_healthbar(x-10, y+15, x+10, y+20, currentHealth, c_white, c_red, c_red, 0, 1, 1);
		}
	} else {
		draw_sprite_ext(sprite_index,1,x,y,1,1,image_angle,c_aqua,0.9); //outline
		draw_sprite_ext(sprite_index,0,x,y,1,1,image_angle,c_aqua,0.9); //draw cloaked
	}
} else draw_self();

HitFlash(); //flash white if it takes damage

if(selected && playerUnit){
	if(smartTarget != noone && instance_exists(smartTarget)){
		draw_sprite_ext(UI_target,0,smartTarget.x,smartTarget.y,1,1,targetRot,c_white,1); //target reticule
	}
}

if (global.showAdvancedInfo && AIEnabled) {
	draw_set_colour(c_red);
	draw_set_alpha(0.25);
	draw_circle(x, y, viewRad, 1);
	
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_text(x,y-20,string(floor(direction)));
	
	draw_set_colour(c_blue);
	draw_set_alpha(0.25);
	draw_circle(x, y, rangeRad, 1);
	
	draw_set_colour(c_red);
	draw_set_alpha(0.5);
	draw_circle(idleX, idleY, satisfiedRad, 1);
	
	if(hasRoute){
		draw_set_colour(c_white);
		draw_set_alpha(0.5);
		draw_circle(exploreX, exploreY, satisfiedRad, 0);
	}
	
	switch (currentMode){
		case Game_ListHandler.AImodes.Idle:
			draw_set_alpha(0.25);
			draw_set_color(c_white);
			draw_circle(x,y,30,0);
			break;
		
		case Game_ListHandler.AImodes.Alert:
			draw_set_alpha(0.25);
			draw_set_color(c_orange);
			draw_circle(x,y,30,0);
			break;
		
		case Game_ListHandler.AImodes.Chase:
			draw_set_alpha(0.25);
			draw_set_color(c_red);
			draw_circle(x,y,30,0);
			break;
		
		case Game_ListHandler.AImodes.Flee:
			draw_set_alpha(0.25);
			draw_set_color(c_yellow);
			draw_circle(x,y,30,0);
			break;
	
		default:
			
			break;
	}
}

/*
---------------------------
		STEP
---------------------------
*/
targetRot++ //rotate reticules

if(hp>maxhp) hp = maxhp; //prevent health overflow

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
					} else Message_NoTarget();
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
		if (keyboard_check(vk_shift) && !lostControl && canUseSkill && skill != Game_ListHandler.skills.Tether && weapon_duration <= 0){
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
		} else if(keyboard_check_pressed(vk_shift) && !lostControl && canUseSkill && skill == Game_ListHandler.skills.Tether){
			if(tetherTarget == noone){
				potentialTether = noone;
				with(Par_player){
					if(distance_to_object(other) < tetherRange && self != other) other.potentialTether = self;
				}

				if(potentialTether != noone) Message_UnitTethered();
				else Message_NoUnitTethered();
				tetherTarget=potentialTether;
				with(tetherTarget) tethered = true;
			}
			else {
				with(tetherTarget) tethered = false;
				tetherTarget = noone;
			}
		}
		else NotSkill();
		if (dashing) {
			motion_add(image_angle, dashspd);
			part_emitter_region(global.P_System, PEmitter_Dash, x+15, x-15, y+15, y-15, ps_shape_rectangle, ps_distr_linear);
			part_emitter_stream(global.P_System, PEmitter_Dash, Part_Dash, 1);
		} else part_emitter_clear(global.P_System, PEmitter_Dash);

		//cap speed and decelerate
		if (keyboard_check_pressed(ord("F"))){ //toggle dampening
			if (damp) damp = false;
			else damp = true;
			Message_Dampeners(damp);
		}

		//create jetstream
		if (!keyboard_check(ord("W")) && !keyboard_check(ord("Q")) && !keyboard_check(ord("E")) && !keyboard_check(ord("S"))) moving = false;
		if(moving && !dashing){
			part_emitter_region(global.P_System, PEmitter_JetStream, x, x, y, y, ps_shape_ellipse, ps_distr_linear);
			part_emitter_stream(global.P_System, PEmitter_JetStream, Part_JetStream, 1);
			
			if(hp<=maxhp/4){ //smoke when damaged
				part_particles_create(global.P_System, x, y, Part_Smoke, 1);
				part_particles_create(global.P_System, x, y, Part_Smoke, 1);
			}
		} else part_emitter_clear(global.P_System, PEmitter_JetStream);
		//part_particles_create(global.P_System, x, y, global.Part_JetStream, 1);

		//shoot
		if (keyboard_check(vk_space) && !lostControl){ //rotate left
			ActivateWeapon(self, image_angle, false);
		}
		
		var beamLength = Game_ListHandler.beam_length;
		var beamX = x+lengthdir_x(beamLength,image_angle)
		var beamY = y+lengthdir_y(beamLength,image_angle)
		if(weapon_duration > 0){ //draw laser beam
			weapon_duration--;
			cloaked = false;
			
			var hitTarget = collision_line(x, y, beamX, beamY, Par_Entity, 1, 1);
			if(instance_exists(hitTarget) && hitTarget.team != team) {
				hitTarget.hp-=Game_ListHandler.beam_damage;
				beamLength = distance_to_point(hitTarget.x,hitTarget.y)
			}
			beamX = x+lengthdir_x(beamLength,image_angle)
			beamY = y+lengthdir_y(beamLength,image_angle)
			draw_line_width(x,y,beamX,beamY,Game_ListHandler.beam_width);
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
		if(distanceToPlayer<=viewRad && instance_exists(target) && target != noone && cloaked){
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
		
		if(hp<=maxhp/4){ //smoke when damaged
			part_particles_create(global.P_System, x, y, Part_Smoke, 1);
			part_particles_create(global.P_System, x, y, Part_Smoke, 1);
		}
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