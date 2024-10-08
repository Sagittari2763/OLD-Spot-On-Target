//-------------------------------Controls-------------------------------\\
//------------Controls Setup------------\\
function controlsSetup() {
	jumpKeyBuffered = 0;
	jumpKeyBufferTime = 5;
	jumpKeyBufferTimer = 0;}
function getControls() {
	
	//------------Directional Inputs------------\\
	rightKey = keyboard_check(global.keybindRight);
	leftKey = keyboard_check(global.keybindLeft);
	
	//------------Action Inputs------------\\ 
	jumpKeyPressed = keyboard_check_pressed(global.keybindJump);
	jumpKey = keyboard_check(global.keybindJump);
	diveKeyPressed = keyboard_check_pressed(global.keybindDown);
	duckKey = keyboard_check_pressed(global.keybindDown);
	runKey = keyboard_check(global.keybindRun);
	runKeyPressed = keyboard_check_pressed(global.keybindRun);
	atkKeyPressed = keyboard_check_pressed(global.keybindAtk);
	
	//------------Clamps------------\\ 
	rightKey = clamp(rightKey,0,1);
	leftKey = clamp(leftKey,0,1);
	jumpKeyPressed = clamp(jumpKeyPressed,0,1);
	jumpKey = clamp(jumpKey,0,1);
	diveKeyPressed = clamp(diveKeyPressed,0,1);
	duckKey = clamp(duckKey,0,1);
	runKey = clamp(runKey,0,1);
	runKeyPressed = clamp(runKeyPressed,0,1);
	atkKeyPressed = clamp(atkKeyPressed,0,1);
	
	//------------Jump Key Buffering------------\\ 
	if jumpKeyPressed {jumpKeyBufferTimer = jumpKeyBufferTime;}
	if jumpKeyBufferTimer > 0 {
	jumpKeyBuffered = 1;
	jumpKeyBufferTimer--;}
	else {jumpKeyBuffered = 0;}
	
}