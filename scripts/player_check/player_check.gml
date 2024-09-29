//This checks if the player is alive. If not, they are free to walk anywhere. 
//Otherwise, they are limited to a certain range of the player's screen.

function player_check(parX=500) {
	allow = false;
	if !instance_exists(oPlayer) {allow = true;}
	else if (x > oPlayer.x+parX or x < oPlayer.x-parX) {allow = false;}
	else {allow = true;}}