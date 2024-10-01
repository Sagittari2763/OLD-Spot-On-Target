player_check(); if !allow {instance_destroy();} //Destroy if not allowed
if (place_meeting(x, y, oEnemy) and !place_meeting(x, y, oIchor)) or place_meeting(x, y, oPlayer) or place_meeting(x, y, oGround) {
	instance_create_depth(x, y, depth, oAcidParticle, {image_angle: moveDir}); //Create particle
	instance_destroy();} //Destroy on use

x += moveSpd*moveDir; //X speed
y += 0; //Y speed
image_speed = 1; //Play sprite