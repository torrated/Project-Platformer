/// @description Fundido a negro al morir

secuencia_iniciada = false;

var_tamano_maximo = 20;
var_tamano = 0;
var_velocidad_tamano = 0.5; //velocidad de fundido
var_pausa = 1.5 * 60; // 60 frames = 1 segundo
var_fin_tamano = 1; // 1 es que deja un círculo. Si se cae a un pozom será var_tamano_maximo

image_xscale = var_tamano; // para que no se vea
image_yscale = var_tamano; // para que no se vea