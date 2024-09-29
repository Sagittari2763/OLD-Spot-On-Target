if !instance_exists(oPause) { //Pause menu
mask_index = sSpider;
player_check(); if allow { //If player is not out of range

	if place_meeting(x, y-5, oGround) and sideCheck = false {image_yscale = -1; y+=32; sideCheck = true;} //Attach the spider to the ceiling if its close
	if sideCheck = true {acidy = -32;} //Flip acid
	else {yspd += grav; if yspd > termVel {yspd = termVel;}} //Gravity and max falling speed
	var _subPixel = 0.5; 
	if place_meeting(x, y+yspd+0.1, oGround) {
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting(x, y+_pixelCheck, oGround) {y += _pixelCheck;} 
		yspd = 0;} //Ground collision
	acidTimer--; //Count down time
	if acidTimer <= 35 {sprite_index = sSpiderAtk;} //Change sprite
	if acidTimer <= 0 {
		instance_create_depth(x+2, y+acidy, depth+1, oWeb); //Create acid web
		acidTimer = acidFrames; sprite_index = sSpider;} //Reset timer and sprite
	image_speed = 1; //Play sprite
	y += yspd; //Insert gravity
	
} //Player check bracket

} else {image_speed = 0;} //Freeze sprite when paused