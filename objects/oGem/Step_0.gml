if !instance_exists(oPause) {

if place_meeting(x, y, oPlayer) and !used {
	instance_create_depth(x-0.5, y-0.5, depth, oGemParticle);
	if global.lastStand {oPlayer.gemCounter+=2;} else {oPlayer.gemCounter++;} used = true; //Increase gem counter upon being collected
	show_debug_message(oPlayer.gemCounter)} //Show gem count
if used {image_alpha -= 0.05; image_speed = 5; y -= yspd; yspd = yspd - yspdRate;} //Animation
else {image_speed = 1;} //Play sprite

if y > oVoid.y {instance_destroy();} //Kill the object after falling out of the world
	
}
else {image_speed = 0;} //Freeze sprite