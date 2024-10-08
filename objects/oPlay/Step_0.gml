if !instance_exists(oFade) { //Fade must be completely gone
if (mouse_check_button_pressed(mb_any) or keyboard_check_pressed(vk_anykey)) and !keyboard_check(vk_escape) and !oTitleCam.menuEnter {
buttonPressTimer = buttonPressFrames;} //Reset timer for animation

if buttonPressTimer = buttonPressFrames/2 {oTitleCam.menuEnter = true;}
buttonPressTimer--;}