//-------------------------------Controls-------------------------------\\
getControls(); //Defines inputs from player_controls
if !instance_exists(oPauseShader) { //Stopping player from doing anything in pause

//-------------------------------Attacking & Damage-------------------------------\\
instance_create_depth(16, 16, -8, oHealthBar);
instance_create_depth(74, 17, -8, oIcon)

if atkKeyPressed and atkCoolTimer <= 0 { //Attack conditions
	atkTimer = atkFrames; atkLagTimer = atkLagFrames; jumpHoldTimer = 0; if yspd < 0 {yspd = 0;} //Setup attack
	if runKey and slideVel > dashAtkSpd {slideVel = moveSpd/0.5;} //Run dash attack
	instance_create_depth(x-12, y-30, 0, oAttack); //Create attack hitbox
	atkCoolTimer = atkCoolFrames} //Reset cooldown timer

if atkTimer > 0 {atkTimer--;} //Timer & hitbox follow player
else {instance_destroy(oAttack) //Delete hitbox
	atkLagTimer--; atkCoolTimer--;} //Decrease damage grace period & cooldown timer
	
if place_meeting(x, y, oEnemy) and atkLagTimer <= 0 and dmgLagTimer <= 0 {healthAmount--;} //Removes one health
if y > oVoid.y {healthAmount = 0; global.pitFall = true;}
if healthAmount > 0 {dmgLagTimer = dmgLagFrames;} //Damage invincibility frames
else {image_alpha = 0; //Makes the player invisible
	instance_create_depth(x, y, -5, oPlayerDeath); //Spawns player death in place
	instance_destroy();} //Deletes player
dmgLagTimer--;

//-------------------------------X Movement-------------------------------\\
if runKey and !wallHit {moveSpd = runSpd;} else {moveSpd = walkSpd;} //Running and walking speed
if iceSlide {slideTime = iceSlideTime;} //Set ice slide
else {slideTime = normalSlideTime;} //Set normal slide
if global.zoomies {moveSpd = zoomiesSpd;}

moveDir = rightKey - leftKey; //Player direction
if moveDir != 0 {moveConst = moveDir;} else {moveDir = moveConst;} //Log direction for sprite

slideVel += slideTime * (rightKey + leftKey); //Amount of slide
if !rightKey and !leftKey and !(slideVel <= 0) {slideVel -= slideTime*slideEndMultiplier; //Slide after movement
	jumpTrue = false; jumpTimer = jumpFrames; moveSpd = walkSpd;} //Reset run jump

if slideVel >= moveSpd {slideVel--;} if slideVel <= 0 {slideVel = 0;} //Speed limits
if !onGround and !runKey {wallHit = true;} //Can't start running in the air
xspd = slideVel * moveDir; //Get xspd 

var _subPixel = 0.5; 
if place_meeting(x+xspd, y, oGround) { 
	var _pixelCheck = _subPixel * sign(xspd) 
	while !place_meeting(x+_pixelCheck, y, oGround) {x += _pixelCheck;} //Scoot up to wall precisely
	xspd = 0; slideVel = 0; jumpTimer = jumpFrames; //Collision with a wall
	if !onGround {iceSlide = false;}} //Collision with a wall midair disables ice
	
x += xspd; 

//-------------------------------Y Movement-------------------------------\\
if diveKeyPressed and !diveTrue and !onGround and !jumpKey { //Diving conditions
	if yspd < 2 {yspd = 2;} diveTrue = true; grav = addGrav; termVel = addVel;} //Diving physics

if onGround {
	if iceSlide and slideVel <= jumpIceSpd {jspd[0] = jumpIce;} //Ice jump height
	else if !iceSlide and runKey and jumpTimer = 0 and xspd != 0 {jspd[0] = jumpRun;} //Run jump height
	else if !iceSlide and runKey and (leftKey or rightKey) and xspd != 0 {jumpTimer--;} //Run jump timer
	else {jspd[0] = jumpNormal;}} //Normal jump height

if coyoteHangTimer > 0 {coyoteHangTimer--;} //Coyote hang timer
else {yspd += grav; setOnGround(false)} //Gravity, no longer on the ground
if yspd > termVel {yspd = termVel;} //Cap falling speed

if onGround {jumpCount = 0; jumpHoldTimer = 0; //Reset jump count & timer on ground
	jumpMax = 1; //Reset jump count
	diveTrue = false; grav = normalGrav; termVel = normalVel; //Reset dive count
	coyoteJumpTimer = coyoteJumpFrames; wallHit = false;} //Reset coyote jump timer & running
else {coyoteJumpTimer--; //Coyote jump timer
	if jumpCount == 0 and coyoteJumpTimer <= 0 {jumpCount = 1;}} //Counts as a jump after coyote time expires 

if jumpKeyBuffered and jumpCount < jumpMax {jumpCount++; //Increase the counter of jumps performed
	jumpKeyBuffered = 0; jumpKeyBufferTimer = 0; //Reset the buffer
	diveTrue = false; grav = normalGrav; termVel = normalVel; //Reset dive
	jumpHoldTimer = jumpHoldFrames[jumpCount-1] //Initiate Jump 
	setOnGround(false);} //The player is no longer on the ground after jumping
if !jumpKey {jumpHoldTimer = 0;} //Cancel jump hold
if jumpHoldTimer > 0 {yspd = jspd[jumpCount-1]; //Hold jump
	jumpHoldTimer--;} //Decrease jump hold timer 

_subPixel = 0.5; 
if place_meeting(x, y+yspd, oGround) {
	var _pixelCheck = _subPixel * sign(yspd) 
	while !place_meeting(x, y+_pixelCheck, oGround) {y += _pixelCheck;} //Scoot up to wall precisely
	if yspd < 0 {jumpHoldTimer = 0;} //Bonk your head on a ceiling tile
	yspd = 0;} //Collision with the ground

if yspd >= 0 and place_meeting(x, y+1, oGround) {setOnGround(true); //Ground collision
	if iceLevel or place_meeting(x, y+1, oIceGround) {iceSlide = true} //Ice ground settings
	else {iceSlide = false}} //No ice

y += yspd;

//-------------------------------Sprites & Extra-------------------------------\\
image_xscale = moveConst; //Flip image based on direction
if atkTimer > 0 {sprite_index = sPlayerAttack;} //Attacking sprite
else if !onGround {sprite_index = sPlayerJump;} //Jumping sprite
else if abs(xspd) > 0 {sprite_index = sPlayerWalk;} //Walking sprite
else {sprite_index = sPlayerIdle;} //Idle sprite

if instance_exists(oAttack) {oAttack.x = x; oAttack.y = y-20;} //Make sure attacks follow the player

}