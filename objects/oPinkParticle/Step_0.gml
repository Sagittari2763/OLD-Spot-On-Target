if !instance_exists(oPause) { //Pause menu
	
if image_index >= 4 {restore = true;} //Reverse at a certain point
	
if restore {image_speed = -1;} //Restore speed
else {image_speed = 1;} //Regular speed
timer--; //Decrease timer
if timer = 0 {instance_destroy();} //Destroy particle once done

}
else {image_speed = 0;} //Freeze sprite