if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) {
	global.keybindType = !global.keybindType;
	instance_create_depth(x, y, -30, oDesaturate);}
if !global.keybindType {image_index = 1;}
else {image_index = 0;}