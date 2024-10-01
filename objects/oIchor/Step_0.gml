mask_index = sIchorIdle;
player_check(); if allow { //If player is not out of range
	if !death { //If not dead
		
	if place_meeting(x, y, oAttack) and dmgTimer <= 0 {damage(1);} //Attack damages Ichor
	if place_meeting(x, y, oLightning) and dmgTimer <= 0 {damage(1);} //Lightning damages Ichor
	if place_meeting(x, y, oSpike) and dmgTimer <= 0 {damage(hp);} //Spike kills Ichor
	if dmgTimer = dmgFrames {acidTimer = 45; ignoreRange = true;} //Shoot acid immediately
	dmgTimer--; //Decrease damage timer
	visualDmg();
	
	if instance_exists(oPlayer) {if oPlayer.x > x and oPlayer.dmgLagTimer <= 0 {moveDir = 1;} //Change direction
	else {if oPlayer.dmgLagTimer <= 0 {moveDir = -1;}}} //Change direction

	if yspd = 0 {slideVel += slideTime * moveDir;} //Increase movement speed in a particular direction
	if slideVel >= moveSpd {slideVel = moveSpd;} //Speed limit
	if slideVel <= -moveSpd {slideVel = -moveSpd;} //Speed limit
	if place_meeting(x+slideVel, y, oGround) or place_meeting(x+slideVel, y, oSpike) {
		slideVel = 0; slideTime = slide;} //Stop moving at a wall
	x += slideVel; //Add onto x
	
	if place_meeting(x, y-4, oGround) {image_yscale = -1; //Attach the spider to the ceiling if its close
		if sideCheck = false {y+=32; sideCheck = true;}} //Keep attached
	else {sideCheck = false;}
	if sideCheck = true {acidy = acidPos2;} //Flip acid
	else {velocity(grav, termVel); acidy = acidPos1;} //Gravity and max falling speed
	if place_meeting(x, y+yspd, oGround) and image_yscale = -1 {image_yscale = 1; y-=34;} //Reset on ground
	
	if instance_exists(oPlayer) {
		player_check(225); if (allow or ignoreRange) and oPlayer.dmgLagTimer <= 0 {
		acidTimer--; //Count down time
		if acidTimer = 40 {image_index = 0; sprite_index = sIchorAttack;} //Change sprite
		if acidTimer = 15 {instance_create_depth(x+(2*moveDir), y+acidy, depth+1, oAcid);} //Create acid web
		if acidTimer <= 0 {acidTimer = acidFrames; sprite_index = sIchorIdle;}} //Reset timer and sprite
		else {sprite_index = sIchorIdle; acidTimer = acidFrames; ignoreRange = false;}} //Reset timer & range
		
	image_xscale = -moveDir; //Change sprite direction
	image_speed = 1; //Play sprite
	
	} else { //If dead
		if deathLog = false {if instance_exists(oPlayer) {deathDir = oPlayer.image_xscale;}
			else {deathDir = -image_xscale;}
			deathLog = true; dmgTimer = dmgFrames/2;}
		x += 1*deathDir; yspd += grav; y+=yspd; image_angle += 2*deathDir; //Death anim.
		dmgTimer--; //Decrease damage timer
		if dmgTimer > 0 {image_blend = c_red;} //Visual damage
		else {image_blend = c_white;} //Visual normal
		image_alpha -= 0.07; if dmgTimer <= -20 {instance_destroy();}}
		
} //Player check bracket