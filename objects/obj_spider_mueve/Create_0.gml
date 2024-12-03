/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Inherit the parent event
event_inherited();

x += random_range(-sprite_width/2,sprite_width/2); //para variar un poco la posicion inicial
velocidad = random_range(0.4,0.5); //variar la velocidad inicial
state = ENEMIGOSTATE.MOVIMIENTO;

self.sprite_index = spr_spider_camina_2
self.image_xscale = 0.5;
self.image_yscale = 0.5;