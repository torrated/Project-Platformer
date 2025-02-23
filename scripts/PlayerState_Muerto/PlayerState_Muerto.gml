function PlayerState_Muerto()
{
	obj_player_parent.var_puede_leer_input = false;
	
	if (audio_is_playing(global.musica))
		{
			audio_stop_sound(global.musica);
			fnc_reinicia_musica();
		}
		
	if (obj_player_parent.image_speed != 1)
		obj_player_parent.image_speed := 0;
	
	if (object_exists(obj_juego))
		time_source_pause(obj_juego.time_per_second); //detiene el reloj
	if (obj_player_parent.yprevious <= obj_player_parent.y) // esto significa que está en el suelo y en frame anterior ya no caia
	{
		var_velocidad_horizontal = 0;
		obj_player_parent.sprite_index = var_sprite_muere;
		obj_player_parent.image_xscale = sign(obj_player_parent.image_xscale)/2;
		obj_player_parent.image_yscale = sign(obj_player_parent.image_yscale)/2;

		if ((obj_player_parent.image_speed == 0) && (obj_vidas.vidas > 0)) //no esta animado
		{
			obj_player_parent.image_speed = 1; // iniciamos la animacion
		}
		else // ya esta animado. Hay que buscar si ha terminado la animacion
		{
			if (obj_player_parent.image_index > obj_player_parent.image_number - 1) // estamos en el ultimo frame de la animacion
			{
				obj_player_parent.image_speed = 0; // detenemos la animacion
				if (obj_vidas.vidas > 0)
				{
					obj_vidas.vidas -= 1;
				}
				if (obj_vidas.vidas >= 1)
				{
					room_restart();
				}
				else
				{
					if !(instance_exists(obj_fundido))
					{
						room_goto_previous();
					}
				}
			}
		}
	}
}