if place_meeting(x, y, oPlayer) and cooldownTimer <= 0 { //Conditions to get an extra jump
	cooldownTimer = cooldownFrames; //Start cooldown
	instance_create_depth(x-11, y-20, oJumpCharge.depth+2, oCap);
	if oPlayer.jumpMax < oPlayer.jumpArrayLength {oPlayer.jumpMax++;}} //Add a jump to the player if they can get one

if cooldownTimer > 0 {cooldownTimer--; sprite_index = sJumpChargeCool; image_alpha -= 0.025;} //Visual cooldown + timer
else {sprite_index = sJumpCharge; image_alpha += 0.025; //Visual ready
	pos = random_range(-17, 0); instance_create_depth(x+pos, y-4, oJumpCharge.depth+1, oPotionParticle);}
image_speed = 1; //Play sprite

if image_alpha > 1 {image_alpha = 1;} if image_alpha < 0.7 {image_alpha = 0.7;} //Transparent limits