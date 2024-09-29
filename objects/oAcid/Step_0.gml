if !instance_exists(oPause) { //Pause menu
	
if (place_meeting(x, y, oEnemy) and !place_meeting(x, y, oSpider)) or place_meeting(x, y, oPlayer) {
	instance_destroy();}

x += moveSpd*moveDir;
y += 0;
image_speed = 1; //Play sprite
	
} else {image_speed = 0;} //Stop sprite at pause