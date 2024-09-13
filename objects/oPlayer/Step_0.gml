//-------------------------------Controls-------------------------------\\
getControls(); //Defines inputs from player_controls
//-------------------------------X Movement-------------------------------\\
if runKey and !wallHit {moveSpd = runSpd;} else {moveSpd = walkSpd;} //Running and walking speed
if iceSlide {slideTime = iceSlideTime;} //Set ice slide
else {slideTime = normalSlideTime;} //Set normal slide
moveDir = rightKey - leftKey; //Player direction
if moveDir != 0 {moveConst = moveDir;} else {moveDir = moveConst;} //Log direction for sprite
image_xscale = moveConst; //Flip image based on direction
slideVel += slideTime * (rightKey + leftKey); //Amount of slide
if !rightKey and !leftKey and !(slideVel <= 0) {slideVel -= slideTime; //Slide after movement
	jumpTrue = false; jumpTimer = jumpFrames;} //Reset run jump
if slideVel >= moveSpd {slideVel--;} if slideVel <= 0 {slideVel = 0;} //Speed limits
if !onGround and !runKey {wallHit = true;} //Can't start running in the air
xspd = slideVel * moveDir; //Get xspd 
var _subPixel = 0.5; 
if place_meeting(x+xspd, y, oGround) { 
	var _pixelCheck = _subPixel * sign(xspd) 
	while !place_meeting(x+_pixelCheck, y, oGround) {x += _pixelCheck;} //Scoot up to wall precisely
	xspd = 0; slideVel = 0; //Collision with a wall
	if !onGround {iceSlide = false; wallHit = true;}} //Collision with a wall midair disables ice & running
x += xspd; 
//-------------------------------Y Movement-------------------------------\\
if diveKeyPressed and !diveTrue and !onGround and !jumpKeyPressed {
	yspd = -2; diveTrue = true; grav += addGrav;} //Diving physics
if onGround {
	if iceSlide and slideVel <= jumpIceSpd {jspd[0] = jumpIce;} //Ice jump height
	else if !iceSlide and runKey and jumpTimer = 0 {jspd[0] = jumpRun;} //Run jump height
	else if !iceSlide and runKey and (leftKey or rightKey) {jumpTimer--;} //Run jump timer
	else {jspd[0] = jumpNormal;}} //Normal jump height
if coyoteHangTimer > 0 {coyoteHangTimer--;} //Coyote hang timer
else {yspd += grav; setOnGround(false)} //Gravity, no longer on the ground
if yspd > termVel {yspd = termVel;} //Cap falling speed
if onGround {jumpCount = 0; jumpHoldTimer = 0; //Reset jump count & timer on ground
	if diveTrue {diveTrue = false; cancelTrue = false; grav -= addGrav;} //Reset dive count
	coyoteJumpTimer = coyoteJumpFrames; wallHit = false;} //Reset coyote jump timer & running
else {coyoteJumpTimer--; //Coyote jump timer
	if jumpCount == 0 and coyoteJumpTimer <= 0 {jumpCount = 1;}} //Counts as a jump after coyote time expires 
if jumpKeyBuffered and jumpCount < jumpMax {jumpCount++; //Increase the counter of jumps performed
	jumpKeyBuffered = 0; jumpKeyBufferTimer = 0; //Reset the buffer
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
//-------------------------------Attacking-------------------------------\\
if atkKeyPressed and atkCool < 0 {
	slideVel += atkSlide; atkCool = atkFrames;} //Sliding and resetting cooldown
if atkCool > -atkFullFrames {atkCool--;} //Timer for attacking