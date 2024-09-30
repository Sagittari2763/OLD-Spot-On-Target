if instance_exists(oPlayer) {
//-------------------------------Controls-------------------------------\\
getControls(); //Defines inputs from player_controls
if !instance_exists(oPause) { //Stopping player from doing anything in pause
mask_index = sPlayerIdle; //Set mask index

//-------------------------------X Movement-------------------------------\\
if runKey and !wallHit {moveSpd = runSpd;} else {moveSpd = walkSpd;} //Running and walking speed
if iceSlide {slideTime = iceSlideTime;} //Set ice slide
else {slideTime = normalSlideTime;} //Set normal slide
if global.zoomies {runSpd = zoomiesSpd;}

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
	var _pixelCheck = _subPixel * sign(xspd);
	while !place_meeting(x+_pixelCheck, y, oGround) {x += _pixelCheck;} //Scoot up to wall precisely
	xspd = 0; jumpTimer = jumpFrames; //Collision with a wall
	if instantTimer <= 0 {slideVel = 0;} //Slow down after timer
	if !onGround {iceSlide = false;}} //Collision with a wall midair disables ice
else {instantTimer = instantFrames;} //Reset timer while not colliding
instantTimer--; //Count timer down
	
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

if (jumpKeyBuffered and jumpCount < jumpMax) {
	jumpCount++; //Increase the counter of jumps performed
	jumpKeyBuffered = 0; jumpKeyBufferTimer = 0; //Reset the buffer
	diveTrue = false; grav = normalGrav; termVel = normalVel; //Reset dive
	jumpHoldTimer = jumpHoldFrames[jumpCount-1] //Initiate Jump
	if jumpCount > 1 {pos = random_range(-12, 12); //Decide particle location
		if !(jumpCount > 3) {instance_create_depth(x+pos, y-4, oPlayer.depth+1, oJumpParticle, {image_index: 1});} //Create particle if the player hasn't jumped thrice
		pos = random_range(-6, 6); //Decide particle location
		if !(jumpCount > 2) {instance_create_depth(x+pos, y-4, oPlayer.depth+1, oJumpParticle, {image_index: 2});} //Create particle if the player hasn't jumped twice
		pos = random_range(-3, 3); //Decide particle location
		instance_create_depth(x+pos, y-4, oPlayer.depth+1, oJumpParticle, {image_index: 3});} //Create particle
	setOnGround(false);} //The player is no longer on the ground after jumping
if !jumpKey {jumpHoldTimer = 0;} //Cancel jump hold
if jumpHoldTimer > 0 {yspd = jspd[jumpCount-1]; //Hold jump
	jumpHoldTimer--;} //Decrease jump hold timer 

_subPixel = 0.5; 
if place_meeting(x, y+yspd, oGround) {
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x, y+_pixelCheck, oGround) {y += _pixelCheck;} //Scoot up to wall precisely
	if yspd < 0 {jumpHoldTimer = 0;} //Bonk your head on a ceiling tile
	yspd = 0;} //Collision with the ground

if yspd >= 0 and place_meeting(x, y+1, oGround) {setOnGround(true); //Ground collision
	if iceLevel or place_meeting(x, y+1, oIceGround) {iceSlide = true} //Ice ground settings
	else {iceSlide = false}} //No ice

y += yspd;

//-------------------------------Attacking & Damage-------------------------------\\
if place_meeting(x, y, oSpike) {healthAmount = 0;} //Player dies at spike
	
if global.lastStand = true {healthMeter = 1;}
if healthAmount > healthMeter {healthAmount = healthMeter;}
if place_meeting(x, y, oEnemy) and dmgLagTimer <= 0 {healthAmount--; //Removes one health
	if healthAmount > 0 {dmgLagTimer = dmgLagFrames; //Damage invincibility frames
	instance_create_depth(x, y, -1, oDashParticle);}} //Creates particle
if healthAmount <= 0 {playerDeath();} //Kills player
if y > oVoid.y {playerDeath(); global.pitFall = true;} //If the player falls out of the level
dmgLagTimer--; //Decrease timer for damage invincibility
if dmgLagTimer > dmgLagEnd {image_alpha = 0.5;} //Turn transparent during damage cooldown
else {image_alpha += 0.05;} //After damage cooldown

if atkKeyPressed and atkCoolTimer <= 0 and dmgLagTimer <= 0 { //Attack conditions
	atkStart = atkStartup; atkTimer = atkFrames; //Setup attack
	if runKey and slideVel > dashAtkSpd and onGround {jumpHoldTimer = 0; slideVel = moveSpd/0.5; dmgLagTimer = dmgDashFrames; //Run dash attack
	instance_create_depth(x, y, -1, oDashParticle);} //Create status effects
	else if global.lightningAtk {instance_create_depth(x+(2*moveConst), y-16, depth+1, oLightning);}
	atkCoolTimer = atkCoolFrames; //Reset cooldown timer
	}
	
if atkStart <= 0 {instance_create_depth(x-12, y-30, 0, oAttack);} //Create attack hitbox
atkStart--; //Decrease startup timer

if atkTimer > 0 {atkTimer--;} //Timer & hitbox follow player
else {instance_destroy(oAttack) //Delete hitbox
	atkCoolTimer--;} //Decrease cooldown timer

//-------------------------------Sprites & Extra-------------------------------\\
image_xscale = moveConst; //Flip image based on direction
if atkTimer > 0 {if !onGround and jumpMax > jumpCount and jumpMax > 1 {sprite_index = sPlayerAttackCharge;} //Charged attack sprite
	else {sprite_index = sPlayerAttack;}} //Attacking sprite
else if !onGround {if jumpMax > jumpCount and jumpMax > 1 {sprite_index = sPlayerJumpCharge;} //Charged jumping sprite
	else {sprite_index = sPlayerJump;}} //Jumping sprite
else if abs(xspd) > 0 {sprite_index = sPlayerWalk;} //Walking sprite
else {sprite_index = sPlayerIdle;} //Idle sprite
image_speed = 1; //Play sprite
if image_alpha > 1 {image_alpha = 1;} //Transparency limit

if instance_exists(oAttack) {oAttack.x = x; oAttack.y = y-20;} //Make sure attacks follow the player

} else {image_speed = 0;} //Freeze sprite

} //Player exists bracket