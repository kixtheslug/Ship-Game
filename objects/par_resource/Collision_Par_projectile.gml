/// @description Take damage
hp-=other.damage;
motion_add(other.image_angle, 1);
instance_destroy(other);

flashAlpha = 1;