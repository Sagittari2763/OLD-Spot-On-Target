//This checks if the player is alive. If not, they are free to walk anywhere. 
//Otherwise, they are limited to a certain range of the player's screen.

allow = false;
function player_check() {
	if !instance_exists(oPlayer) {allow = true;}
	else if (x > oPlayer.x+500 or x < oPlayer.x-500) {allow = false;}
	else {allow = true;}}