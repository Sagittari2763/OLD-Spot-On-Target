on_camera(10, 33);
if instance_exists(oPlayer) {
	if !oPlayer.onGround and oPlayer.coyoteJumpTimer <= 0 {
		if oPlayer.jumpMax - oPlayer.jumpCount = 3 {image_index = 3;} //3 jumps left
		else if oPlayer.jumpMax - oPlayer.jumpCount = 2 {image_index = 2;} //2 jumps left
		else if oPlayer.jumpMax - oPlayer.jumpCount = 1 {image_index = 1;} //1 jump left
		else {image_index = 0;}}
	else {image_index = 0;}}
	else {image_index = 0;}