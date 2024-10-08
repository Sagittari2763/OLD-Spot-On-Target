if !instance_exists(oPlayer) or !global.zoomies {instance_destroy();} //Kill if player doesn't exist or doesn't have zoomies
image_alpha -= fadeRate; //Fade out
if image_alpha < 0 {instance_destroy();} //Kill once completely faded