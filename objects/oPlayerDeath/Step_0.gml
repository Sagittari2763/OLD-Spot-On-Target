image_xscale = moveDir; //Sprite direction
if global.pitFall = true {airTime = 0; jspd *= 2;} //No floating & extra jump if death is from a pit

if airTime <= 0 { //If the player is not being held in the air
	sprite_index = sPlayerFaint; //Change to fainting sprite
	yspd += grav; //Gravity

	if !fall {yspd = jspd; fall = true;} //Jump up when not falling

	x += moveDir*launch; //X movement
	y += yspd; //Y movement
	image_angle += moveDir*2;} //Sprite rotation

else {airTime--;} //Count down air timer
image_speed = 1; //Play sprite

fadeTime--; //Count down reset timer
if fadeTime = 0 and global.autoReset {room_fade(room);} //Reset room