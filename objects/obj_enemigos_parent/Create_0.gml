/// @description Estado inicial

var_flash = 1; //se utiliza para cuando es golpeado
state = ENEMIGOSTATE.QUIETO; //estado inicial
en_el_suelo = false;
velocidad = 0;
contador = 0; //en estado QUIETO, se usa para voltear image_xscale