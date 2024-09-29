if place_meeting(x, y, oAcid) {
	instance_create_depth(x+4, y, 1, oHardParticle); //Particle
	instance_create_depth(x+8, y, 1, oHardParticle); //Partile
	instance_destroy();} //Attack destroys block