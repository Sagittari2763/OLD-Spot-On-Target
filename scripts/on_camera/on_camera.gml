function on_camera(posX=0, posY=0){
camera = view_get_camera(0);
x = camera_get_view_x(camera)+posX;
y = camera_get_view_y(camera)+posY;
}