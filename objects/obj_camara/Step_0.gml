/// @description Control de la cámara

// actualizamos destino
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}



//actualizamos posicion
x += (xTo - x) / 15;
y += (yTo - y) / 15;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);



// actualizamos la camara
camera_set_view_pos(camara1,x-view_w_half,y-view_h_half);