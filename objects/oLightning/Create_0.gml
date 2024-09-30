part2 = random_range(0, 1);
part3 = random_range(0, 1);
rand1 = random_range(-10, 5)
rand2 = random_range(-10, 5)
rand3 = random_range(-10, 5)
moveSpd = 5;
initY = y;
if instance_exists(oPlayer) {if oPlayer.image_xscale = 1 {moveDir = 1;} else {moveDir = -1;} //Move direction
	playerY = oPlayer.y;} 
else instance_destroy();