if place_meeting(x, y, oAttack) {
	instance_create_depth(x+4, y, 1, oBlockParticle); //Particle
	instance_create_depth(x+8, y, 1, oBlockParticle); //Partile
	instance_destroy();} //Attack destroys block