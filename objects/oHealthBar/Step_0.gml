on_camera(10, 10);
if instance_exists(oPlayer) {image_alpha = 1; //Visible hearts when player
	if oPlayer.healthAmount = 3 {sprite_index = sHealthBar;} //Three health
	if oPlayer.healthAmount = 2 {sprite_index = sHealthBar_1;} //Two health
	if oPlayer.healthAmount = 1 {sprite_index = sHealthBar_2;}} //One health
else if instance_exists(oPlayerDeath) {sprite_index = sHealthBar_3;} //Zero health
else {image_alpha = 0;} //Invisible hearts without player