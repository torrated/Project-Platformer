function PlayerState_Muerto()
{
	var_puede_leer_input = false;
	if (yprevious <= y) // esto significa que está en el suelo y en frame anterior ya no caia
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
				obj_vidas.vidas -= 1;
				if (obj_vidas.vidas >= 1)
				{
					room_restart(); // se reinicia la fase
				}
				else
				{
					obj_vidas.vidas := obj_vidas.vidas_inicial;
					room_goto_previous();
				}
			}
		}
	}
}