if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) {
	buttonPressTimer = buttonPressFrames;} //Reset timer for animation

if buttonPressTimer > 0 {image_index = 1;} //Begin animation
else {image_index = 0;} //Reset button back to normal

if buttonPressTimer = buttonPressFrames/2 {
	if oTitleCam.settingEnter {oTitleCam.settingEnter = false;} else {oTitleCam.menuEnter = false;}}
buttonPressTimer--;