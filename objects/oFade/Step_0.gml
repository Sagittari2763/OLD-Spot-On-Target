image_alpha += fadeRate;
if image_alpha >= 1 {image_alpha = 1; fadeRate *= -1 room_goto(numb);}
if image_alpha < 0 {instance_destroy();}