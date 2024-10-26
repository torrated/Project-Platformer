/// @description

x += velocidad;


if (x <= x_izquierda)
{
	image_xscale = -1;
	velocidad = velocidad * -1;
	puede_golpear = true;
}



if (x >= x_derecha)
	instance_destroy(self);