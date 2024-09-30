var _moveDir = 0;
yspd += grav; 
y += yspd;
image_angle += rot;
image_alpha -= 0.05;
timer--;
if timer <= 0 {instance_destroy();}