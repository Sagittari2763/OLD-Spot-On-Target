if !death { //If enemy is not dead
	
	if instance_exists(oPlayer) {playerDir = oPlayer.image_xscale} //Set current player direction for death
	player_check(); if allow { //If player is not out of range
	
	dirLog = moveDir; //Log move direction
	if place_meeting(x, y, oAttack) {damage(1);} //Attack kills Yoob
	if place_meeting(x, y, oLightning) {damage(1);} //Lightning kills Yoob
	if place_meeting(x, y, oSpike) {damage(1);} //Spike kills Yoob
	if place_meeting(x, y, oAcid) {damage(1);} //Acid kills Yoob
	dmgTimer--; //Decrease damage timer
	visualDmg();

	if yspd = 0 {slideVel += slideTime * moveDir;} //Increase movement speed in a particular direction
	if slideVel >= moveSpd {slideVel = moveSpd;} //Speed limit
	if slideVel <= -moveSpd {slideVel = -moveSpd;} //Speed limit
	if place_meeting(x+slideVel, y, oGround) or place_meeting(x+slideVel, y, oSpike) {
		slideVel = 0; slideTime = slide;} //Stop moving at a wall

	if instance_exists(oPlayer) and oPlayer.image_alpha = 1 {
		if oPlayer.x > x + 10 {moveDir = 1;} //Move towards player
		else if oPlayer.x < x - 10 {moveDir = -1;}} //Move towards player
	else {moveDir = 0; //Stop when player dies
		if slideVel > 0 {slideVel -= slide;} //Slide when player dies
		else if slideVel < 0 {slideVel += slide;}} //Slide when player dies

	x += slideVel; //Add onto x

	velocity(grav, termVel)

	if moveDir != 0 {image_xscale = -moveDir;} //Sprite direction
	if instance_exists(oPlayer) and oPlayer.image_alpha = 1 {sprite_index = sYoobWalk;} //Walking sprite
	else {sprite_index = sYoobIdle;} //Idle sprite
	image_speed = 1; //Play sprite
	if dirLog != moveDir {image_index = 0;}

	} //Player check bracket

} else { //If enemy is dead
	if !particle {instance_create_depth(x, y+3, depth+1, oGoobParticle, {sprite_index: sYoobDeathParticle}); particle = true;}
	instance_destroy();} 