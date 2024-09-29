if !instance_exists(oPause) { //Pause menu

timer--; //Decrease timer
if timer = 0 {instance_destroy();} //Destroy particle once done
if image_index = 5 {image_speed = 0;}
else {image_speed = 1;}

}
else {image_speed = 0;} //Freeze sprite