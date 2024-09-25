function yoobDeath() {
	visible = false; //Make it invisible while creating death animation
	instance_create_depth(x, y, depth, oYoobDeath); //Create death animation
	instance_destroy();} //Destroy the enemy

slideVel = 0; //Movement of it
moveSpd = 1; //Speed of it
moveDir = -1; //Direction of it
dirLog = 0;
slide = 0.1; //How much it will slide to begin with
slideTime = slide; //How much it will slide

yspd = 0; //How fast it is falling
grav = .375; //How much speed it gains over time
termVel = 7; //How fast it can fall
instant = true; //Does it change directions instantly instead of gradually?

sprDir = 0; //Direction of sprite