yspd = 0; //How fast the object is going
grav = .375; //The weight added onto the object
jspd = -3.6; //How high up the object leaps
moveDir = -oPlayer.moveConst; //Get the current direction from the player
fall = false; //If object is falling

airTime = 5; //How long the object stays in the air before falling

launch = 2; //Launch distance

image_xscale = -moveDir; //Sprite direction