//-------------------------------Player Functions-------------------------------\\
function setOnGround(_val = true) { //If the player is on the ground
if _val == true {onGround = true; coyoteHangTimer = coyoteHangFrames;} //Resets on ground
else {onGround = false; coyoteHangTimer = 0;}} //No longer on ground

controlsSetup(); //Sets up controls from player_controls

//-------------------------------X Movement-------------------------------\\
xspd = 0;

moveDir = 0; //Current direction of movement
moveConst = 1; //Last direction of movement
moveSpd = 0; //The current moving speed, walking or running
walkSpd = 3; //Fastest walking speed
runSpd = 7; //Fastest running speed

slideVel = 0;
slideTime = 0; 
iceLevel = false; //If the entire level is slippery
iceSlide = false; //If the current ground is slippery
normalSlideTime = 0.22; //How much the player can slide normally
iceSlideTime = 0.03; //How much the player can slide on ice
slideEndMultiplier = 1.8; //How much less the player will slide at the end of movement

//-------------------------------Y Movement-------------------------------\\
onGround = true; //If the player is on the ground
yspd = 0;

grav = .375; //How fast the player can jump
termVel = 7; //How fast the player can fall
normalGrav = .375; //How fast the player can jump normally
normalVel = 7; //How fast the player can fall normally
addGrav = .575; //How fast the player can fall after diving
addVel = 10; //How fast the player will fall after diving

jspd[0] = 0; //How long the player can hold a jumpcharge jump, change through below variables
jumpNormal = -3.6; //How high the player can jump
jumpRun = -4.2; //How high the player can jump while running
jumpIce = -3.2; //How high the player can jump on ice
jspd[1] = -3.6; //How long the player can hold a jumpcharge jump
jspd[2] = -2.4; //How long the player can hold a second jumpcharge jump
jspd[3] = -1.2; //How long the player can hold a third jumpcharge jump

jumpIceSpd = 2.8; //How much speed is required for the player to do a full jump on ice
jumpFrames = 24; //The period required to run before doing a higher jump
jumpTimer = 0; //Timer for above varable
jumpMax = 1; //How many times the player can jump
jumpCount = 0; //The amount of jumps performed
jumpHoldFrames[0] = 18; //How long the player can hold the jump
jumpHoldFrames[1] = 18; //How long the player can hold a jumpcharge jump
jumpHoldFrames[2] = 9; //How long the player can hold a second jumpcharge jump
jumpHoldFrames[3] = 3; //How long the player can hold a third jumpcharge jump
jumpHoldTimer = 0; //How many frames the player has held a jump

jumpTrue = false; //If the player input a jump
wallHit = false; //If the player should be forced to stop running
diveTrue = false; //If the player dived
jumpArrayLength = array_length(jspd); //Records how many jumps the player can perform

//-------------------------------Coyote Time-------------------------------\\
coyoteHangFrames = 3; //How many frames the player hangs in the air before falling
coyoteHangTimer = 0; //How many frames the player has hung in the air before falling
coyoteJumpFrames = 6; //How many frames the player falls before they can't jump
coyoteJumpTimer = 0; //How many frames the player has fallen before they can't jump

//-------------------------------Attacking & Damage-------------------------------\\
atkFrames = 18; //How many frames the attack will last
atkTimer = 0; //Timer for above
atkCoolFrames = 22; //How many frames before the player can attack again
atkCoolTimer = 0; //Timer for above
atkLagFrames = 3; //How many frames the player can avoid damage after attacking
atkLagTimer = 0; //Timer for above



