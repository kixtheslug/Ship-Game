draw_set_alpha(1);
draw_self();
HitFlash(); //flash white if it takes damage

if (global.showAdvancedInfo) {
	draw_set_colour(c_red);
	draw_set_alpha(0.25);
	draw_circle(x, y, viewRad, 1);
}