if place_meeting(x, y, oPlayer) and !used {
	instance_create_depth(x-0.5, y-0.5, depth, oGemParticle); image_alpha = 0.75;
	if global.lastStand {oPlayer.gemCounter+=2;} else {oPlayer.gemCounter++;} used = true;} //Increase gem counter upon being collected
if used {image_alpha -= 0.05; image_speed = 5; y -= yspd; yspd = yspd - yspdRate;} //Animation
else {image_speed = 1;} //Play sprite

if y > oVoid.y {instance_destroy();} //Kill the object after falling out of the world