var _camWidth = camera_get_view_width(view_camera[0]); //Camera width
var _camHeight = camera_get_view_height(view_camera[0]); //Camera height

if instance_exists(oPlayer) {
	playerX = oPlayer.x; //Player x axis
	playerY = oPlayer.y;} //Player y axis
	
var _camX = playerX - _camWidth/2; //X position of camera
var _camY = playerY - _camHeight/2; //Y position of camera

_camX = clamp(_camX, 0, room_width - _camWidth); //Room border x
_camY = clamp(_camY, 0, room_height - _camHeight); //Room border y
finalCamX += (_camX - finalCamX) * camTrailSpd; //Camera trailing x
finalCamY += (_camY - finalCamY) * camTrailSpd; //Camera trailing y

if timer <= 0 {camera_set_view_pos(view_camera[0], finalCamX, finalCamY);}
else {camera_set_view_pos(view_camera[0], _camX, _camY);}
timer--;

//----------Control Panel----------\\
if keyboard_check_pressed(vk_backspace) and !global.autoReset and !instance_exists(oPlayer) {room_fade(room);} //Reset room key
if keyboard_check_pressed(vk_escape) and !instance_exists(oFade) {room_fade(title_screen); //Start fade
	if instance_exists(oPlayer) {global.gemCounter += oPlayer.gemCounter; show_debug_message(global.gemCounter);}} //Add global gem count
if keyboard_check_pressed(vk_f11) {window_set_fullscreen(!window_get_fullscreen());} //Fullscreen toggle