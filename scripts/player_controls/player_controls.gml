//-------------------------------Controls-------------------------------\\
//------------Controls Setup------------\\
function controlsSetup() {
	jumpKeyBuffered = 0;
	jumpKeyBufferTime = 5;
	jumpKeyBufferTimer = 0;}
function getControls() {
	
	//------------Directional Inputs------------\\
	rightKey = keyboard_check(vk_right)+ gamepad_button_check(0, gp_padr);
	leftKey = keyboard_check(vk_left) + gamepad_button_check(0, gp_padl);
	
	//------------Action Inputs------------\\ 
	jumpKeyPressed = keyboard_check_pressed(vk_up) + gamepad_button_check_pressed(0, gp_face1);
	jumpKey = keyboard_check(vk_up) + gamepad_button_check(0, gp_face1);
	diveKeyPressed = keyboard_check_pressed(vk_down) + gamepad_button_check_pressed(0, gp_face2);
	duckKey = keyboard_check_pressed(vk_down) + gamepad_button_check_pressed(0, gp_face2);
	runKey = keyboard_check(vk_shift) + gamepad_button_check(0, gp_face3);
	runKeyPressed = keyboard_check_pressed(vk_shift) + gamepad_button_check_pressed(0, gp_face3);
	atkKeyPressed = keyboard_check_pressed(ord("Z")) + gamepad_button_check_pressed(0, gp_face3);
	
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
	
	//------------Pause Menu------------\\ 
	}