if instance_exists(oPlayer) {
image_speed = 0; 
image_alpha = 0.25;
fadeRate = 0.035; //How fast the phantom fades
image_xscale = oPlayer.image_xscale; //Get current player rotation
sprite_index = oPlayer.sprite_index;} //Get current player sprite
else {instance_destroy();} //Kill if player doesn't exist