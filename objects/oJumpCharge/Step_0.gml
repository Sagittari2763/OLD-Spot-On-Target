if !instance_exists(oPauseShader) { //Pause menu

if place_meeting(x, y, oPlayer) and cooldownTimer <= 0 { //Conditions to get an extra jump
	cooldownTimer = cooldownFrames; //Start cooldown
	instance_create_depth(x-11, y-20, oJumpCharge.depth+2, oCap);
	if oPlayer.jumpMax < oPlayer.jumpArrayLength {oPlayer.jumpMax++;}} //Add a jump to the player if they can get one

if cooldownTimer > 0 {cooldownTimer--; sprite_index = sJumpChargeCool;} //Visual cooldown + timer
else {sprite_index = sJumpCharge; //Visual ready
	pos = random_range(-17, 0); instance_create_depth(x+pos, y-4, oJumpCharge.depth+1, oPotionParticle);}
image_speed = 1; //Play sprite

}
else {image_speed = 0;} //Freeze sprite