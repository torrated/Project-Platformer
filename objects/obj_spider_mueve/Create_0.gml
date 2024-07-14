/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

x += random_range(-sprite_width/2,sprite_width/2); //para variar un poco la posicion inicial
velocidad = random_range(0.4,0.5); //variar la velocidad inicial
state = ENEMIGOSTATE.MOVIMIENTO;