/// @description Estado inicial

var_flash = 1; //se utiliza para cuando es golpeado
state = ENEMIGOSTATE.QUIETO; //estado inicial
en_el_suelo = false;
velocidad = 0;
contador = 0; //en estado QUIETO, se usa para voltear image_xscale
destruir_al_salir = false; // si true, la instancia se destruye al salir de la pantalla
destruir_al_salir_x = 0;
vidas = 1;



//estos sprites se utilizan al inicializar los bosses
sprite_idle = noone;
sprite_ataque_1 = noone;
sprite_ataque_2 = noone;
sprite_movimiento = noone;
sprite_damaged = noone;
sprite_muerto = noone;



//para definir la secuencia de ataque de un boss
contador_secuencia = 0;
secuencia_ataque = []; //para contener la secuenta de STATEs que conforman la bucle del boss
estado_iniciado = -2; // cuando un script de la state machine se inicia, pone aqui su valor. -2: secuencia parada