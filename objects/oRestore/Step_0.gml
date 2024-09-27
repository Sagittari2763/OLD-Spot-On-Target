if !instance_exists(oPauseShader) { //Pause

image_speed = 1; //Speed
if place_meeting(x, y, oPlayer) and !used {
	if oPlayer.healthAmount < oPlayer.healthMeter {oPlayer.healthAmount++;} //Give player health on collection
	used = true;} //The restore has been used
if used {
	image_alpha -= 0.05; sprite_index = sRestoreCollect; y -= yspd; yspd = yspd - yspdRate;} //Animation
	
if y > oVoid.y {instance_destroy();} //Kill the object after falling out of the world

}
else {image_speed = 0;} //Freeze sprite