if !death { //If enemy is not dead
	
	if instance_exists(oPlayer) {playerDir = oPlayer.image_xscale} //Set current player direction for death
	player_check(); if allow { //If player is not out of range

	if place_meeting(x, y, oAttack) {damage(1);} //Attack kills Goob
	if place_meeting(x, y, oLightning) {damage(1);} //Lightning kills Goob
	if place_meeting(x, y, oYoob) {damage(1);} //Yoob kills Goob
	if place_meeting(x, y, oSpike) {damage(1);} //Spike kills Goob
	if place_meeting(x, y, oAcid) {damage(1);} //Acid kills Goob
	dmgTimer--; //Decrease damage timer
	visualDmg();

	if yspd = 0 {slideVel += slideTime * moveDir;} //Increase movement speed in a particular direction
	else {if abs(yspd) > 0 {slideVel = 0;}} //Stop movement
	if slideVel >= moveSpd {slideVel = moveSpd; slideTime = slideVel;} //Speed limit + no delay at full speed
	if slideVel <= -moveSpd {slideVel = -moveSpd;} //Speed limit
	if place_meeting(x+slideVel, y, oGround) or place_meeting(x+slideVel, y, oSpike) {
		slideVel = 0; moveDir = -moveDir; //Flip direction
		if sprite_index = sGoobIdle {image_index = 0; sprIgnore = true; image_xscale = sprDir;}} //Stop flipping + reset anim.
	else {sprIgnore = false; sprDir = moveDir;} //Continue flipping
	x += slideVel; //Add onto x

	velocity(grav, termVel);

	if !sprIgnore {image_xscale = -moveDir;} //Sprite direction
	if abs(slideVel) > 0 and yspd = 0 {sprite_index = sGoobWalk;} //Walking sprite
	else {sprite_index = sGoobIdle;} //Idle sprite
	image_speed = 1; //Play sprite

	} //Player check bracket
	
} else { //If enemy is dead
		
	if !particle {instance_create_depth(x, y+3, depth+1, oGoobParticle); particle = true;}
	instance_destroy();} //Count down air timer