/// @description Animaciones

if (tiempo_accion <= 0)
{
	tiempo_accion = max_tiempo_accion;
	
	eleccion = choose("saltar","correr");
	switch (eleccion)
	{
		case "saltar":
			sprite_index = var_sprite_saltando;
			var_velocidad_vertical = var_velocidad_salto;
			salta = true;
			break;
	}
}

tiempo_accion -= 1;

	
if (salta) 
{
	var_velocidad_vertical += gravedad;
}

if (y > yInicial) 
{
	y = yInicial;
	salta = false;
	var_velocidad_vertical = 0;
	sprite_index = var_sprite_corriendo;
}
y += var_velocidad_vertical;