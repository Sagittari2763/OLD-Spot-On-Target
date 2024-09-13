//-------------------------------Player Functions-------------------------------\\
function setOnGround(_val = true) { //If the player is on the ground
if _val == true {onGround = true; coyoteHangTimer = coyoteHangFrames;} //Resets on ground
else {onGround = false; coyoteHangTimer = 0;}} //No longer on ground
controlsSetup();
//-------------------------------X Movement-------------------------------\\
xspd = 0;
moveDir = 0;
moveConst = 1;
moveSpd = 0; 
walkSpd = 3; //Changeable -- fastest walking speed
runSpd = 7; //Changeable -- fastest running speed
slideVel = 0;
slideTime = 0; 
iceLevel = false;
iceSlide = false;
normalSlideTime = 0.43; //Changeable -- how much the player can slide normally
iceSlideTime = 0.03; //Changeable -- how much the player can slide on ice
//-------------------------------Y Movement-------------------------------\\
onGround = true;
yspd = 0;
grav = .375; //Changeable -- how fast the player can jump
termVel = 7; //Changeable -- how fast the player can fall
addGrav = .2; //Changeable -- how fast the player can fall after diving
addVel = 3; //Changeable -- how fast the player will fall after diving
jspd[0] = 0; 
jspd[1] = -3.6; //Changeable -- how long the player can hold a jumpcharge jump
jspd[2] = -2.4; //Changeable -- how long the player can hold a second jumpcharge jump
jspd[3] = -1.2; //Changeable -- how long the player can hold a third jumpcharge jump
jumpNormal = -3.6; //Changeable -- how high the player can jump
jumpRun = -4.2; //Changeable -- how high the player can jump while running
jumpIce = -3.2; //Changeable -- how high the player can jump on ice
jumpIceSpd = 2.8; //Changeable -- how much speed is required for the player to do a full jump on ice
jumpFrames = 24; //Changeable -- the period required to run before doing a higher jump
jumpTimer = 0;
jumpTrue = false;
jumpMax = 1; //Changeable -- how many times the player can jump
jumpCount = 0;
jumpHoldFrames[0] = 18; //Changeable -- how long the player can hold the jump
jumpHoldFrames[1] = 18; //Changeable -- how long the player can hold a jumpcharge jump
jumpHoldFrames[2] = 9; //Changeable -- how long the player can hold a second jumpcharge jump
jumpHoldFrames[3] = 3; //Changeable -- how long the player can hold a third jumpcharge jump
jumpHoldTimer = 0;
wallHit = false;
diveTrue = false;
cancelTrue = false;
jumpArrayLength = array_length(jspd);
//-------------------------------Coyote Time-------------------------------\\
coyoteHangFrames = 3;
coyoteHangTimer = 0;
coyoteJumpFrames = 6;
coyoteJumpTimer = 0;
//-------------------------------Attacking-------------------------------\\
