if !instance_exists(oPauseShader) { //Pause enemy

if place_meeting(x, y, oAttack) {goobDeath();} //Attack kills Goob
if place_meeting(x, y, oYoob) and oYoob.sprite_index = sYoobWalk {goobDeath();} //Yoob kills Goob

if yspd = 0 {slideVel += slideTime * moveDir;} //Increase movement speed in a particular direction
else {if abs(yspd) > 0 {slideVel = 0;}} //Stop movement
if slideVel >= moveSpd {slideVel = moveSpd; slideTime = slideVel;} //Speed limit + no delay at full speed
if slideVel <= -moveSpd {slideVel = -moveSpd;} //Speed limit
if place_meeting(x+slideVel, y, oGround) {
	slideVel = 0; moveDir = -moveDir; //Flip direction
	if sprite_index = sGoobIdle {image_index = 0; sprIgnore = true; image_xscale = sprDir;}} //Stop flipping + reset anim.
else {sprIgnore = false; sprDir = moveDir;} //Continue flipping
x += slideVel; //Add onto x

if place_meeting(x, y+yspd+0.5, oGround) {yspd = 0;} //Collision
else {yspd += grav; slideTime = slide; image_index = 0;} //Add gravity + restart x delay time + reset anim.
if yspd >= termVel {yspd = termVel;} //Speed limit
y += yspd; //Add onto y

if !sprIgnore {image_xscale = -moveDir;} //Sprite direction
if abs(slideVel) > 0 and yspd = 0 {sprite_index = sGoobWalk;} //Walking sprite
else {sprite_index = sGoobIdle;} //Idle sprite
image_speed = 1; //Play sprite

}
else {image_speed = 0;} //Freeze sprite