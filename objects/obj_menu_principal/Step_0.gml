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
		audio_play_sound(snd_coin,1,false);
		if (menuprincipal_seleccion) < 0 menuprincipal_seleccion = array_length(que_menu_muestro)-1;
		menuprincipal_seleccion = menuprincipal_seleccion mod array_length(que_menu_muestro);
	}
}
if (global.abajo)
{
	if !(eleccion)
	{
		menuprincipal_seleccion++;
		audio_play_sound(snd_coin,1,false);
		menuprincipal_seleccion = menuprincipal_seleccion mod array_length(que_menu_muestro);
	}
}
if (global.enter)
{
	if !(eleccion)
	{
		if !(opciones)
		{
			switch (menuprincipal_seleccion)
			{
				case 0: opciones = false; eleccion = true; break;
				case 1: opciones = true; menuprincipal_seleccion = 0; break;
				case 2: game_end(); break;
			}
		}
		else
		{
			switch (menuprincipal_seleccion)
			{
				case 0: if (global.idioma == 1) global.idioma = 0; else global.idioma = 1; break;
				case 1: opciones = false; break;
			}
		}
	}
}