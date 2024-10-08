if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) {
	window_set_fullscreen(!window_get_fullscreen());} //Fullscreen toggle
if window_get_fullscreen() {image_index = 1;}
else {image_index = 0;}