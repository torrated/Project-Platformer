/// @description Control parallax del fondo y opciones

if (room_get_name(room) == room_get_name(room_first))
{
	indice_parallax--;

	x = indice_parallax;
	if (layer_exists("Montanas")) layer_x("Montanas",x * 0.05);
	if (layer_exists("Arboles_Lejanos")) layer_x("Arboles_Lejanos",x * 0.25);
	if (layer_exists("Arboles_Cercanos")) layer_x("Arboles_Cercanos",x * 0.50);
	if (layer_exists("Arbustos")) layer_x("Arbustos",x * 0.75);
	if (layer_exists("Suelo")) layer_x("Suelo",x * 1);
}


//navegacion por el menu
if (global.arriba)
{
	if !(eleccion)
	{
		menuprincipal_seleccion--;
		audio_play_sound(snd_coin,1,false,global.volumen_audio/10);
		if (menuprincipal_seleccion) < 0 menuprincipal_seleccion = array_length(que_menu_muestro)-1;
		menuprincipal_seleccion = menuprincipal_seleccion mod array_length(que_menu_muestro);
	}
}
if (global.abajo)
{
	if !(eleccion)
	{
		menuprincipal_seleccion++;
		audio_play_sound(snd_coin,1,false,global.volumen_audio/10);
		menuprincipal_seleccion = menuprincipal_seleccion mod array_length(que_menu_muestro);
	}
}
if (global.enter)
{
	if !(eleccion)
	{
		if (opciones + controles + audio == 0) // estamos viendo el menu principal
		{
			switch (menuprincipal_seleccion)
			{
				case 0: opciones = false; eleccion = true; break; // nuevo juego
				case 1: opciones = true; menuprincipal_seleccion = 0; break; // opciones
				case 2: game_end(); break; //salir
			}
		}
		else
		{
			if (opciones)
			{
				switch (menuprincipal_seleccion)
				{
					case 0: if (global.idioma == 1) global.idioma = 0; else global.idioma = 1; break;
					case 1: audio = true; opciones = false; menuprincipal_seleccion = 0; break;
					case 2: audio = false; opciones = false;  menuprincipal_seleccion = 0; break;
				}
			}
			else if ((audio) && (menuprincipal_seleccion == 2))
			{
				audio = false; 
				opciones = true; 
				menuprincipal_seleccion = 0; 
			}
		}
	}
}

//con el siguiente codigo se sube o baja el volumen
var _direccion = global.derecha_pressed - global.izquierda_pressed;
if ((_direccion <> 0) && (audio))
{
	switch (menuprincipal_seleccion)
	{
		case 0: {
			global.volumen_musica = clamp(global.volumen_musica + _direccion,0,10); 
			audio_play_sound(snd_coin,1,false,global.volumen_musica/10);
			audio_sound_gain(global.musica,global.volumen_musica/10,0);
			break;
		}
		case 1: {
			global.volumen_audio = clamp(global.volumen_audio + _direccion,0,10); 
			audio_play_sound(snd_coin,1,false,global.volumen_audio/10);
			break;
		}
	}
}