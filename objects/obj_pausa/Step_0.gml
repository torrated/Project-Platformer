/// @description Control del menu

if (global.pausa)
{/// @description (des)activa la pausa

	pausa = !pausa;
	
	if (pausa)
	{
		time_source_pause(obj_juego.time_per_second);
		if (audio_is_playing(obj_juego.musica))
		{
			audio_pause_sound(obj_juego.musica);
		}
		
		var _obj_settings_id = obj_settings.id;
		instance_deactivate_all(true);
		instance_activate_object(_obj_settings_id);
	}
	else
	{
		instance_activate_all();
		audio_resume_sound(obj_juego.musica);
	}
}



if (pausa) && (global.enter)
{//Seleccion

	if (pausa) && !(eleccion)
	{
		if !(idioma)
		{
			switch (menupausa_seleccion)
			{
				case 0: instance_activate_all(); audio_resume_sound(obj_juego.musica); pausa = false; break;
				case 1: idioma = true; break;
				case 2: room = room_first; break;
			}
		}
		else //idioma
		{
			switch (menupausa_seleccion)
			{
				case 0: if (global.idioma == 1) global.idioma = 0; else global.idioma = 1; break;
				case 1: idioma = false; break;
			}
		}
	}
}



if (pausa) && (global.arriba)
{/// @description Sube el menu

	if (pausa) && !(eleccion)
	{
		menupausa_seleccion--;
		audio_play_sound(snd_coin,1,false);
		if (menupausa_seleccion) < 0 menupausa_seleccion = array_length(que_menu_muestro)-1;
		menupausa_seleccion = menupausa_seleccion mod array_length(que_menu_muestro);
	}
}


if (pausa) && (global.abajo)
{/// @description Baja el menu

	if (pausa) && !(eleccion)
	{
		menupausa_seleccion++;
		audio_play_sound(snd_coin,1,false);
		menupausa_seleccion = menupausa_seleccion mod array_length(que_menu_muestro);
	}
}