function PlayerState_Muerto()
{
	var_puede_leer_input = false;
	if (yprevious <= y) // esto significa que esta en el suelo y en frame anterior ya no caia
	{																						if is_debug_overlay_open() show_debug_message("Muerto y no cae");
		var_velocidad_horizontal = 0;
		sprite_index = var_sprite_muere;

		if (image_speed == 0) //no esta animado
		{																					if is_debug_overlay_open() show_debug_message("Muerto y no esta animado");
			image_speed = 1; // iniciamos la animacion
		}
		else // ya esta animado. Hay que buscar si ha terminado la animacion
		{																					if is_debug_overlay_open() show_debug_message("Muerto y si esta animado");
			if (image_index > image_number - 1) // estamos en el ultimo frame de la animacion
			{																				if is_debug_overlay_open() show_debug_message("Muerto y estamos en el ultimo frame");
				image_speed = 0; // detenemos la animacion
				game_restart(); // se reinicia el juego
			}
		}
	}
}