if instance_exists(oPlayer) {image_alpha = 1; //Visible hearts when player
	if oPlayer.healthAmount = 3 {image_index = 3;} //Three health
	if oPlayer.healthAmount = 2 {image_index = 2;} //Two health
	if oPlayer.healthAmount = 1 {image_index = 1;}} //One health
else if instance_exists(oPlayerDeath) {image_index = 0;} //Zero health