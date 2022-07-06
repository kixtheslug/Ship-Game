function FindTrueAngle(){
	var ang;
	if(image_angle>360) ang = image_angle % 360;
	else if(image_angle<-360) ang = 360-(abs(image_angle)%360);
	else if(image_angle<0) ang = 360-abs(image_angle);
	else ang = image_angle;
	
	return ang;
}