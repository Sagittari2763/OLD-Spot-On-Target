if place_meeting(x, y, oAttack) or place_meeting(x, y, oAcid) { //If attacked
	x = -9999; y = -9999; activeTimer = true; atkTimer = atkFrames; //Move block temporarily
	instance_create_depth(initx-0.5, inity-0.5, depth, oPinkParticle);} //Create particle
if activeTimer {atkTimer--;} //Decrease timer
if !instance_place(initx, inity, oPlayer) and !instance_place(initx, inity, oEnemy) {
	if atkTimer = 15 {instance_create_depth(initx-0.5, inity-0.5, depth, oPinkParticle, {image_index: 4});} //Use particle
	if atkTimer <= 0 {x = initx; y = inity; activeTimer = false;}} //Restore block
else if atkTimer <= 15 {atkTimer = 16;} //Don't count down while entity is inside