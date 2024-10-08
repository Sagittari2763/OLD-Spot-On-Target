function room_fade(numb){
	cam = 0;
	if instance_exists(oCamera) {cam = oCamera;} else if instance_exists(oTitleCam) {cam = oTitleCam;}
	else {exit;}
	instance_create_depth(cam.x, cam.y, cam.depth-1, oFade);
	oFade.numb = numb;
}