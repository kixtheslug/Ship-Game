/// @description Movement and Shooting

/*
----------CONTROLS----------
MOVEMENT:
Rotation: A & D
Strafe: W + S (forward and reverse) & Q + E (left and right)
Dash: shift
Toggle Dampening: F

UI:
Advanced Info: B (done outside of player, controlled in camera)
*/

if(!Game_Camera.paused && !Game_Camera.selectMode){ //dont work if paused
	if(lostControl){
		image_angle+=rotatespd;
		moving = false;
	}

	if(selected){ //only the unit in control by the player will respond to controls
		//directional movement
		if (keyboard_check(ord("W")) && !dashing && !lostControl){ //move up
			motion_add(image_angle, movespd);
			moving = true;
		}
		if (keyboard_check(ord("Q")) && !dashing && !lostControl){ //strafe left
			motion_add(image_angle+90, movespd);
			moving = true;
		}
		if (keyboard_check(ord("E")) && !dashing && !lostControl){ //strafe right
			motion_add(image_angle-90, movespd);
			moving = true;
		}
		if (keyboard_check(ord("S")) && !dashing && !lostControl){ //reverse
			motion_add(image_angle, -movespd);
			moving = true;
		}

		//dash
		if (keyboard_check(vk_shift) && !lostControl){
			dashing = true
		} else dashing = false
		if (dashing) {
			motion_add(image_angle, dashspd);
			part_emitter_region(global.P_System, PEmitter_Dash, x+15, x-15, y+15, y-15, ps_shape_rectangle, ps_distr_linear);
			part_emitter_stream(global.P_System, PEmitter_Dash, Part_Dash, 1);
		} else part_emitter_clear(global.P_System, PEmitter_Dash);

		//cap speed and decelerate
		if (keyboard_check(ord("F"))){ //toggle dampening
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

		//rotation
		if (keyboard_check(ord("A")) && !dashing && !lostControl){ //rotate left
			image_angle += rotatespd
		}
		if (keyboard_check(ord("D")) && !dashing && !lostControl){ //rotate right
			image_angle -= rotatespd
		}

		//shoot
		if (keyboard_check_pressed(vk_space) && !lostControl){ //rotate left
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
}

//regular movement
if (speed > speedCp && !dashing)  speed = speedCp
else if (dashing) speed = speedCp*1.67; //dashing speed cap
if (damp && !lostControl) speed = max(speed-0.01,0)

//lock to gamemap
MapBorderCollision();