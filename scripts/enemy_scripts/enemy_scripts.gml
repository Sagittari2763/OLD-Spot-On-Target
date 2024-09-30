function velocity(grav, termVel){
	var _subPixel = 0.5; 
	yspd += grav;
	if yspd > termVel {yspd = termVel;}
	if place_meeting(x, y+yspd, oGround) {
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting(x, y+_pixelCheck, oGround) {y += _pixelCheck;} 
		if yspd < 0 {yspd = 0;} //Bonk the head on a ceiling tile
		yspd = 0;} //Ground collision
		
	y += yspd; //Insert gravity
}

function damage(dmgAmount) {
	hp -= dmgAmount; //Take damage
	if hp <= 0 {death = true;} //Death
	else {dmgTimer = dmgFrames;} //Damage lag
	if dmgTimer > 0 {image_blend = c_red;} //Visual damage
	else {image_blend = c_white;} //Visual normal
	show_debug_message(hp);
}

function visualDmg() {
if dmgTimer > 0 image_blend = c_red; //Visual damage
	else image_blend = c_white;} //Visual normal