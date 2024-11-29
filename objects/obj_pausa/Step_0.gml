/// @description Control del menu

if (global.pausa)
{/// @description (des)activa la pausa

	if ((instance_exists(obj_fundido)) && !(obj_fundido.secuencia_iniciada)) //secuencia iniciada signica que el personaje murió
	{
		pausa = !pausa;
	
		if (pausa)
		{
			time_source_pause(obj_juego.time_per_second);
			if (instance_exists(obj_player_parent))
			{
				last_state = obj_player_parent.state;
				obj_player_parent.state = PLAYERSTATE.QUIETO;
				last_puede_leer_input = obj_player_parent.var_puede_leer_input;
				obj_player_parent.var_puede_leer_input = false;
			}

			var _obj_settings_id = obj_settings.id;
			instance_deactivate_all(true);
			instance_activate_object(_obj_settings_id);
		}
		else
		{
			instance_activate_all();
			if (instance_exists(obj_player_parent))
			{
				obj_player_parent.state = last_state;
				obj_player_parent.var_puede_leer_input = last_puede_leer_input;
			}
		}
	}
}



if (pausa) && (global.enter)
{//Seleccion

	if (pausa) && !(eleccion)
	{
		if (!(idioma) && !(volumen))
		{
			switch (menupausa_seleccion)
			{
				case 0: {
					instance_activate_all(); 
					audio_resume_sound(global.musica); 
					pausa = false; 
					if (instance_exists(obj_player_parent))
					{
						obj_player_parent.state = PLAYERSTATE.LIBRE;
						obj_player_parent.var_puede_leer_input = last_puede_leer_input;
					}
					break;
				}
				case 1: idioma = true; volumen = false; break;
				case 2: room = MenuPrincipal; break;
			}
		}
		else //idioma
		{
			if (idioma)
				{
				switch (menupausa_seleccion)
				{
					case 0: if (global.idioma == 1) global.idioma = 0; else global.idioma = 1; break;
					case 1: volumen = true; idioma = false; menupausa_seleccion = 0; break;
					case 2: volumen = false; idioma = false; menupausa_seleccion = 0; break;
				}
			} //audio
			else if ((volumen) && (menupausa_seleccion == 2))
			{
				volumen = false;
				idioma = true;
				menupausa_seleccion = 0; 
			}
		}
	}
}


if (pausa) && (global.arriba)
{/// @description Sube el menu

	if (pausa) && !(eleccion)
	{
		menupausa_seleccion--;
		audio_play_sound(snd_coin,1,false,global.volumen_audio/10);
		if (menupausa_seleccion) < 0 menupausa_seleccion = array_length(que_menu_muestro)-1;
		menupausa_seleccion = menupausa_seleccion mod array_length(que_menu_muestro);
	}
}


if (pausa) && (global.abajo)
{/// @description Baja el menu

	if (pausa) && !(eleccion)
	{
		menupausa_seleccion++;
		audio_play_sound(snd_coin,1,false,global.volumen_audio/10);
		menupausa_seleccion = menupausa_seleccion mod array_length(que_menu_muestro);
	}
}

//con el siguiente codigo se sube o baja el volumen
var _direccion = global.derecha_pressed - global.izquierda_pressed;
if ((_direccion <> 0) && (volumen))
{
	switch (menupausa_seleccion)
	{
		case 0: global.volumen_musica = clamp(global.volumen_musica + _direccion,0,10); audio_play_sound(snd_coin,1,false,global.volumen_musica/10); audio_sound_gain(global.musica,global.volumen_musica/10,0); break;
		case 1: global.volumen_audio = clamp(global.volumen_audio + _direccion,0,10); audio_play_sound(snd_coin,1,false,global.volumen_audio/10);break;
	}
}