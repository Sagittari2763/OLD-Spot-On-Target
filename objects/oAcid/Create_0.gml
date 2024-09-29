moveSpd = 5;
initY = y;
if instance_exists(oPlayer) {if oPlayer.x > x {moveDir = 1;} else {moveDir = -1;} //Move direction
	playerY = oPlayer.y;} 
else instance_destroy();