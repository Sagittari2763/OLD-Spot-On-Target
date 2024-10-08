if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) {
	global.autoReset = !global.autoReset;}
if global.autoReset {image_index = 1;}
else {image_index = 0;}