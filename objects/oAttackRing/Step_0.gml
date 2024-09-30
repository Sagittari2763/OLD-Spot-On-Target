//on_camera(10, 33);
if instance_exists(oPlayer) {
	if oPlayer.atkCoolTimer <= 0 and oPlayer.dmgLagTimer <= 0 {image_index = 1;}
	else {image_index = 0;}}
else {image_index = 0;}