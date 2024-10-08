var _camWidth = camera_get_view_width(view_camera[0]); //Camera width
var _camHeight = camera_get_view_height(view_camera[0]); //Camera height

var _camX = posX - _camWidth/2; //X position of camera
var _camY = posY - _camHeight/2; //Y position of camera

_camX = clamp(_camX, 0, room_width - _camWidth); //Room border x
_camY = clamp(_camY, 0, room_height - _camHeight); //Room border y
finalCamX += (_camX - finalCamX) * camTrailSpd; //Camera trailing x
finalCamY += (_camY - finalCamY) * camTrailSpd; //Camera trailing y

camera_set_view_pos(view_camera[0], finalCamX, finalCamY);

//----------Camera Positioning----------\\
if menuEnter {posX = room_width; if settingEnter {posY = room_height;} else {posY = 0;}}
else {posX = 0; posY = 0;}