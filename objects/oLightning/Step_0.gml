player_check(); if !allow {instance_destroy();} //Destroy if not allowed
if moveDir > 0 {add = 14;} else {add = 4;}
if place_meeting(x, y, oGround) {
	instance_create_depth(x+add, y+rand1, depth-3, oLightningParticle, {image_angle: -moveDir}); //Create particle
	if part2 {instance_create_depth(x+add, y+rand2, depth-3, oLightningParticle, {image_angle: -moveDir});} //Create particle
	if part3 {instance_create_depth(x+add, y+rand3, depth-3, oLightningParticle, {image_angle: -moveDir});} //Create particle
	instance_destroy();} //Destroy on ground

x += moveSpd*moveDir; //X speed
y += 0; //Y speed
image_speed = 1; //Play sprite
