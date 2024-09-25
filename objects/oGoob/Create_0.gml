function goobDeath() {
	visible = false; //Make it invisible while creating death animation
	instance_create_depth(x, y, depth, oGoobDeath); //Create death animation
	if !place_meeting(x, y, oAttack) {oGoobDeath.airTime = 0;} //No air time if death isn't player
	instance_destroy();} //Destroy the enemy

slideVel = 0; //Movement of it
moveSpd = 1; //Speed of it
moveDir = -1; //Direction of it
slide = 0.1; //How much it will slide to begin with
slideTime = slide; //How much it will slide

yspd = 0; //How fast it is falling
grav = .375; //How much speed it gains over time
termVel = 7; //How fast it can fall
instant = true; //Does it change directions instantly instead of gradually?

sprDir = 0; //Direction of sprite
sprIgnore = false; //Ignore idle sprite flipping