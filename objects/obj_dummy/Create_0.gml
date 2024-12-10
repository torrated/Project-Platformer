/// @description Posicion inicial

yInicial = y;
salta = false;
gravedad = 0.4;
var_velocidad_vertical = 0;
var_velocidad_salto = -6;

max_tiempo_accion = 3 * 60; // 5 segundos
tiempo_accion = max_tiempo_accion;

eleccion = noone;

var_sprite_corriendo = spr_pelotilla_correr;
var_sprite_saltando = spr_pelotilla_salto;
image_xscale = sign(image_xscale)/2;
image_yscale = sign(image_yscale)/2;