yspd = 0;
grav = .375; //The weight added onto the object
jspd = -3.6; //How high up the object leaps
moveDir = oPlayer.moveConst; //Get the current direction from the player
fall = false; //If object is falling

airTime = 10; //How long the object stays in the air before falling
enemyFrames = 30; //How long the object can fall without getting hit by an enemy
enemyTimer = enemyFrames; //Timer for above
shortEnemyTimer = 0; //Short version of enemy timer

launch = 1; //Launch distance

image_xscale = moveDir; //Sprite direction