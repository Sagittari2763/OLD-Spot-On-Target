if !instance_exists(oPauseShader) { //Pause menu

yspd += grav; //Gravity

if !fall {yspd = jspd; fall = true;} //Jump up when not falling
else {image_alpha -= 0.025;} //Fade out
x += rot*0.1; //X movement
y += yspd; //Y movement
image_angle += rot; //The rotation of the object

if y > oVoid.y {instance_destroy();} //Kill the object after falling out of the world

}