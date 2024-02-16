/// @description Activar el shader para volverse blanco
draw_self();

if (var_flash > 0)
{
	shader_set(Blanco);
	draw_self();
	shader_reset();
	var_flash -= 1;
}