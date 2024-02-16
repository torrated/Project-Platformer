function PlayerState_Golpeado()
{
	// al ser golpeados por un enemigo, saltamos hacia atras y perdemos uno de salud y activamos el estado golpeado
	if !(var_golpeado) // no podemos ser golpeados si estamos en estado golpeado
	{																						if is_debug_overlay_open() show_debug_message("Golpeado");
		var_velocidad_vertical = var_velocidad_salto/1.5; // velocidad salto es negativa, asi que sumamos
		var_velocidad_horizontal = var_velocidad_golpeado * sign(image_xscale);
		var_golpeado =  true;
		var_salud -= 1;
		alarm[0] = 120; // para desactivar el estado golpeado
	}



	var_velocidad_vertical += var_gravedad;
		
		
		
	if ((var_velocidad_vertical >= 0) && (var_en_el_suelo))
	{		
																							if is_debug_overlay_open() show_debug_message("Golpeado y en el suelo");
		var_puede_leer_input = true;
	
		if (var_salud <= 0)
		{																					if is_debug_overlay_open() show_debug_message("Golpeado y sin vida");
			state = PLAYERSTATE.MUERTO;
		}
		else
		{																					if is_debug_overlay_open() show_debug_message("Golpeado y con vida");
			state = PLAYERSTATE.LIBRE;
		}
		
	}
	

	// colision vertical
	if (place_meeting(x,y+var_velocidad_vertical,layer_tilemap_get_id("Tileset2")))
	{																							if is_debug_overlay_open() show_debug_message("Golpeado y colision vertical");
		while (!place_meeting(x,y+sign(var_velocidad_vertical),layer_tilemap_get_id("Tileset2")))
		{
			y += sign(var_velocidad_vertical);
		}
		var_velocidad_vertical = 0;
	}
	y += var_velocidad_vertical;
}