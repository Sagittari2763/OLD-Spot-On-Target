if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) {screen = true;} //Activate click
if screen {x -= 6; image_xscale = -1; if x <= -32 {screen = false;}} //Send back to beginning
else {image_xscale = 1;} //Flip back to normal
x += 2
if x > 576 {x = -32} //Screen loop