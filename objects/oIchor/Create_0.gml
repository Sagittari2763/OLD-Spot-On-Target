/*function damage(dmgAmount) {
	hp -= dmgAmount; if hp <= 0 {death = true;} //Death
	else {dmgTimer = dmgFrames; acidTimer = 45;}} //Damage lag, shoot acid immediately}*/

acidFrames = 180; //How long it takes to spit out acid
acidTimer = acidFrames; //Timer for above
acidy = 0; //Position of acid y
acidPos1 = 25; //Position of acid normally
acidPos2 = -28; //Position of acid upside down

slideVel = 0; //X movement
slide = 0; //How much it will slide to begin with
slideTime = slide; //How much it will slide
moveDir = -1; //Direction of enemy
moveSpd = 1; //Max move speed of enemy
flip = false; //If the enemy should be flipped

sideCheck = false; //If the spider can be upside down
yspd = 0; //Y movement
grav = .375; //Gravity
termVel = 7; //Max falling speed

hp = 2; //Health points
dmgFrames = 25; //Frames until enemy can take damage again
dmgTimer = 0; //Timer for above
ignoreRange = false;
death = false; //If enemy is dead
deathDir = 0; //Direction of death
deathLog = false; //If death has been logged