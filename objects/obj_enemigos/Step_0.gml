// Crea enemigos en un tiempo aleatorio

if (!instance_exists(obj_enemigos_parent))
{
	// crea el enemigo en geronimo.x + ancho de la camara
	instance_create_layer(obj_geronimo.x+camera_get_view_width(view_get_camera(0)),200,"Enemigos",obj_pajaro1);
}
