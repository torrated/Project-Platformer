/// @description Opciones del menu principal

indice_parallax = 0;

menuprincipal_seleccion = 0; //opcion elegida al pulsar Enter
eleccion = false; //para iniciar el fundido a negro
i_fundido = 0;//velocidad del fundido a negro
fin_de_fundido = false; //para saber cuándo ha terminado el fundido

opciones = false; //para saber si hay que mostrar el menu opciones o no
controles = false; //para saber si hay que mostrar el menu controles o no
audio = false;  //para saber si hay que mostrar el menu controles o no
que_menu_muestro = noone;

window_set_cursor(cr_none); // deshabilita el cursor del ratón