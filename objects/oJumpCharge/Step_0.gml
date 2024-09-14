if place_meeting(x, y, oPlayer) and cooldownTimer <= 0 and !oPlayer.diveTrue { //Conditions to get an extra jump
	cooldownTimer = cooldownFrames; //Start cooldown
	if oPlayer.jumpMax < oPlayer.jumpArrayLength {oPlayer.jumpMax++;}} //Add a jump to the player if they can get one

if cooldownTimer > 0 {cooldownTimer--; sprite_index = sJumpChargeCool;} //Visual cooldown + timer
else {sprite_index = sJumpCharge} //Visual ready