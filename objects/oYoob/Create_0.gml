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
playerDir = 0; //Direction of player

hp = 1; //Health points
dmgFrames = 15; //Frames until enemy can take damage again
dmgTimer = 0; //Timer for above
death = false; //If the object is dead
particle = false; //Plays particle