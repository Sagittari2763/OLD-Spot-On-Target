var _moveDir = 0;
yspd += grav; 
x += xspd;
y += yspd;
image_angle += rot;
image_alpha -= 0.1;
timer--;
if timer <= 0 {instance_destroy();}