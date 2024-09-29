//Player Functions
	//Health system & taking damage
	//Attacking & attack cooldown
	//Death function
	//Falling out of the level
	//Slippery corners while jumping
	//Water damage
		//Takes damage after falling into water
		//Respawns near the water or at the last checkpoint
	
//Items & Blocks
	//Healing potion/heart
		//Golden version of healing item to restore full health
	//Spike block
		//Player takes damage on contact
	//Death block
		//The player will die upon contact
	//Ultra death block
		//Anything that comes in contact with it dies
	//Slopes
		//Short slopes
		//Long slopes
		//High slopes (automatically slide downwards)
		
//Enemies
	//Goob
		//Walks 
		//Falls off corners with no movement
	//Yoob
		//Follows the player around
		//Will wait for them if the player is in the same Y axis
	//Altamaha-ha
		//Throws dead fish at you for attacks
		//Doesn't move, stuck in water
	//Mothman (Boss)
		//Destroys platforms for attacks
		//Chase him upwards until you corner him
		//Flies down for you to strike, vurnerable to attacks 
	
//World
	//World map, Mario style
	//Make one object for every level, should be able to reassign based on the instance
		//Defaults to level_1 if not assigned
	