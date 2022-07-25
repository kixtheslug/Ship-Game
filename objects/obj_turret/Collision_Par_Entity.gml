/// @description Insert description here
if(other.team != team){ //do not collide with friendlies
	if(!lostControl) hp-=10;

	lostControl = true;
	alarm[11] = room_speed*2;
	
	flashAlpha = 1;
}