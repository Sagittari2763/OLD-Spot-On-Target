if !instance_exists(oPauseShader) { //Pause menu

image_xscale = moveDir; //Sprite direction
if global.pitFall = true {airTime = 0; jspd *= 2;} //No floating & extra jump if death is from a pit

if airTime <= 0 { //If the player is not being held in the air
	sprite_index = sPlayerFaint; //Change to fainting sprite
	yspd += grav; //Gravity

	if !fall {yspd = jspd; fall = true;} //Jump up when not falling

	if global.launchFurther = true {enemyTimer = shortEnemyTimer; //Shortens enemy timer
		launch = 10;} //Launch player further with ability active 
	x += moveDir*launch; //X movement
	y += yspd; //Y movement
	image_angle += moveDir*2;} //Sprite rotation

else {airTime--;} //Count down air timer
image_speed = 1; //Play sprite

if keyboard_check_pressed(vk_backspace) {room_goto(room);} //reset room

}
else {image_speed = 0;} //Freeze sprite