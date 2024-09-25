if !instance_exists(oPauseShader) { //Pause menu

yspd += grav; //Gravity

if !fall {yspd = jspd; fall = true;} //Jump up when not falling
y += yspd; //Y movement
image_angle += 3; //The rotation of the object

if y > oVoid.y {instance_destroy();} //Kill the object after falling out of the world

}