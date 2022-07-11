/// @description Insert description here
event_inherited();

sprite_list = [
spr_asteroid1,
spr_asteroid2,
spr_asteroid3,
spr_ice1,
spr_ice2
]
sprite_index = sprite_list[irandom_range(0,array_length(sprite_list)-1)];

lostControl = false
team = noone;

//randomize sprite
image_speed = 0;
image_index = irandom(2);
image_angle = random_range(0,360);

//health
maxhp = random_range(30,60);
hp = maxhp;