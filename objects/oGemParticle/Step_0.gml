if !instance_exists(oPause) { //Pause menu

timer--; //Decrease timer
image_alpha -= 0.075; //Fade out
if timer = 0 {instance_destroy();} //Destroy particle once done

}
else {image_speed = 0;} //Freeze sprite