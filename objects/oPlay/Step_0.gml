if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, id) and !roomEnter {
	roomTimer = roomFrames; roomEnter = true; sprite_index = sPlay2;} //Changes sprite and starts timer
if roomTimer = 0 and roomEnter {room_goto_next()} //After the timer, it switches the room
else {roomTimer--;} //Timer
if roomTimer <= 20 and roomEnter {sprite_index = sPlay;} //Sprite change after 10 frames