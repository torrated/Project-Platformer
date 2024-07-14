/// @description Configuración de la cámara

camara1 = view_camera[0];
if (instance_exists(obj_player)) follow = obj_player;

view_w_half = camera_get_view_width(camara1)/2;
view_w_third = camera_get_view_width(camara1)/3;
view_h_half = camera_get_view_height(camara1)/2;
xTo = xstart;
yTo = ystart;
pos = room_width-view_w_half-300;

sizeSpeed = 1; //alejamiento actual
sizeSpeedMax = 100; //alejamiento maximo
sizeSpeedIncrease = 1; //velocidad de alejamiento
sizeMultiplier = 0.1;

alejar = false;