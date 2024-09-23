if place_meeting(x, y, oAttack) { //If attacked
	image_alpha = 0; //Make it invisible while creating death animation
	instance_create_depth(x, y, depth, oGoobDeath); //Create death animation
	instance_destroy()} //Destroy the enemy

if yspd = 0 {slideVel += slideTime * moveDir;} //Increase movement speed in a particular direction
else {if abs(yspd) > 0 {slideVel = 0;}} //Stop movement
if slideVel >= moveSpd {slideVel = moveSpd; slideTime = slideVel;} //Speed limit + no delay at full speed
if slideVel <= -moveSpd {slideVel = -moveSpd;} //Speed limit
if place_meeting(x + slideVel, y-0.5, oGround) or place_meeting(x + slideVel, y-0.5, oEnemy) {
	slideVel = 0; moveDir = -moveDir; //Flip direction
	if sprite_index = sGoobIdle {sprIgnore = true; image_xscale = sprDir;}} //Stop flipping
else {sprIgnore = false; sprDir = moveDir;} //Continue flipping
x += slideVel; //Add onto x

if place_meeting(x, y+yspd, oGround) or place_meeting(x, y+yspd, oEnemy) {yspd = 0;} //Collision
else {yspd += grav; slideTime = slide;} //Add gravity + restart x delay time
if yspd >= termVel {yspd = termVel;} //Speed limit
y += yspd; //Add onto y

if !sprIgnore {image_xscale = -moveDir;} //Sprite direction
if abs(slideVel) > 0 and yspd = 0 {sprite_index = sGoobWalk;} //Walking sprite
else {sprite_index = sGoobIdle;} //Idle sprite