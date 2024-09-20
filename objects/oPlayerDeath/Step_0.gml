image_xscale = moveDir; //Sprite direction
if global.pitFall = true {airTime = 0; jspd *= 2;} //No floating & extra jump if death is from a pit

if airTime <= 0 { //If the player is not being held in the air
	sprite_index = sPlayerFaint; //Change to fainting sprite
	yspd += grav; //Gravity

	if place_meeting(x, y, oEnemy) and enemyTimer <= 0 {fall = false; moveDir*= -1; //Start falling after small hop
		enemyTimer = enemyFrames;} //Reset enemy collision timer
	if !fall {yspd = jspd; fall = true;} //Jump up when not falling

	if global.launchFurther = true {enemyTimer = shortEnemyTimer; //Shortens enemy timer
		launch = 10;} //Launch player further with ability active 
	x += moveDir*launch; //X movement
	y += yspd; //Y movement
	image_angle += moveDir*2; //Sprite rotation

	enemyTimer--;} //Count down enemy collision timer
else {airTime--;} //Count down air timer