function PlayerState_Golpeado()
{
	// al ser golpeados por un enemigo, saltamos hacia atras y perdemos uno de salud y activamos el estado golpeado
	if !(var_golpeado) // no podemos ser golpeados si estamos en estado golpeado
	{
		var_velocidad_vertical = var_velocidad_salto/1.5; // velocidad salto es negativa, asi que sumamos
		var_velocidad_horizontal = var_velocidad_golpeado * sign(image_xscale);
		var_golpeado =  true;
		var_salud -= 1;
		alarm[0] = 120; // para desactivar el estado golpeado
	}



	var_velocidad_vertical += var_gravedad;
	if (var_puede_saltar > 0) && (var_key_jump) // si puede saltar y se presiona saltar
	{
		var_velocidad_vertical = var_velocidad_salto;
		audio_play_sound(snd_salto,1,false,global.volumen_audio/10);
		var_puede_saltar = 0;
	}	
		
		
		
	if ((var_velocidad_vertical >= 0) && (var_en_el_suelo))
	{		
		obj_player_parent.var_puede_leer_input = true;
	
		if (var_salud <= 0)
		{
			state = PLAYERSTATE.MUERTO;
		}
		else
		{
			state = PLAYERSTATE.LIBRE;
		}
		
	}
	

	// colision vertical
	if (place_meeting(x,y+var_velocidad_vertical,layer_tilemap_get_id(obj_juego.tileset)))
	{
		while (!place_meeting(x,y+sign(var_velocidad_vertical),layer_tilemap_get_id(obj_juego.tileset)))
		{
			y += sign(var_velocidad_vertical);
		}
		var_velocidad_vertical = 0;
	}
	y += var_velocidad_vertical;
	
	
	
	// calcular movimiento horizontal
	if (obj_player_parent.var_puede_leer_input)
	{
		var _var_move = var_key_right - var_key_left; // si mueve a la derecha entonces esto vale 1. Si izquierda, -1. Si nada o ambos, 0
		if (var_key_run) var_velocidad_horizontal = _var_move * var_velocidad_correr;
		else var_velocidad_horizontal = _var_move * var_velocidad_caminar;
	}
	x += var_velocidad_horizontal;
}