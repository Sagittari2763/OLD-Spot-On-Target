if !instance_exists(oPlayer) exit; //Exit without player
var _camWidth = camera_get_view_width(view_camera[0]); //Camera width
var _camHeight = camera_get_view_height(view_camera[0]); //Camera height

var _camX = oPlayer.x - _camWidth/2; //X position of camera
var _camY = oPlayer.y - _camHeight/2; //Y position of camera

_camX = clamp(_camX, 0, room_width - _camWidth); //Room border x
_camY = clamp(_camY, 0, room_height - _camHeight); //Room border y
finalCamX += (_camX - finalCamX) * camTrailSpd; //Camera trailing x
finalCamY += (_camY - finalCamY) * camTrailSpd; //Camera trailing y

if timer <= 0 {camera_set_view_pos(view_camera[0], finalCamX, finalCamY);}
else {camera_set_view_pos(view_camera[0], _camX, _camY);}
timer--;

//----------Control Panel----------\\
if keyboard_check_pressed(vk_backspace) {room_goto(room);} //reset room
if keyboard_check_pressed(vk_f11) {window_set_fullscreen(!window_get_fullscreen());}