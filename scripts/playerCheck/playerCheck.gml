allow = false;
function playerCheck() {
	if !instance_exists(oPlayer) {allow = true;}
	else if (x > oPlayer.x+500 or x < oPlayer.x-500) {allow = false;}
	else {allow = true;}}