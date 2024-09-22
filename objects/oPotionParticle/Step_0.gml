y += 0.15; //How fast the particle travels
image_alpha -= 0.03; //How fast the particle disappears

timer--; //Decrease the timer
if timer <= 0 {instance_destroy();} //Destroy the particle after the timer is up