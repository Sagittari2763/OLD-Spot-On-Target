if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) {
	global.musicVol = !global.musicVol;}
if global.musicVol {image_index = 1;}
else {image_index = 0;}