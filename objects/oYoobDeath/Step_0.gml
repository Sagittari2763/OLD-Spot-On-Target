if !instance_exists(oPauseShader) { //Pause menu

mask_index = sGoobIdle; //Set hitbox
if global.pitFall = true {airTime = 0; jspd *= 2;} //No floating & extra jump if death is from a pit

if airTime <= 0 { //If it is not being held in the air
	sprite_index = sYoobWalk; //Change to fainting sprite
	yspd += grav; //Gravity

	if place_meeting(x, y, oAttack) and !fall {moveDir*= -1;} //Start falling after small hop
	if !fall {yspd = jspd; fall = true;} //Jump up when not falling

	if global.launchFurther = true {
		launch = 10;} //Launch it further with ability active 
	x += moveDir*launch; //X movement
	y += yspd; //Y movement
	image_angle += moveDir*2; //Sprite rotation
	image_index = 1;} //No animation

else {airTime--;} //Count down air timer

}