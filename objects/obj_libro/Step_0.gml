/// Comportamiento del enemigo

// Movimiento

x -= var_velocidad;

if (x < obj_player.x-camera_get_view_width(view_get_camera(0)))
// se destruye cuando sale de la pantalla por la izquierda
{
	instance_destroy();
}
