// Comportamiento de los enemigos

// Desplazamiento sencillo hacia la izquierda
x -= var_velocidad-(var_gravedad_horizontal*var_velocidad);
if (abs(var_gravedad_horizontal) > 0)
{																		if is_debug_overlay_open() show_debug_message("Enemigo con Gravedad horizontal");
	if (var_gravedad_horizontal > 0) var_gravedad_horizontal -= 0.1;
	if (var_gravedad_horizontal < 0) var_gravedad_horizontal += 0.1;
}

if (x < obj_player.x-camera_get_view_width(view_get_camera(0)))
// se destruye cuando sale de la pantalla por la izquierda
{																		if is_debug_overlay_open() show_debug_message("Enemigo sale de la pantalla");
	instance_destroy();
}
