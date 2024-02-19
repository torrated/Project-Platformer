function PlayerState_Libre()
{ // mira a ver de usar move_and_collide()
	// calcular movimiento
	if (var_puede_leer_input)
	{																							if is_debug_overlay_open() show_debug_message("Se puede leer el input");
		var _var_move = var_key_right - var_key_left; // si mueve a la derecha entonces esto vale 1. Si izquierda, -1. Si nada o ambos, 0
		if (var_key_run) var_velocidad_horizontal = _var_move * var_velocidad_correr;
		else var_velocidad_horizontal = _var_move * var_velocidad_caminar;
	}


	var_velocidad_vertical += var_gravedad;

	if (var_en_el_suelo && var_key_jump) // si esta en el suelo y se presiona saltar
	{																							if is_debug_overlay_open() show_debug_message("En el suelo y se pulsa saltar");
		var_velocidad_vertical = var_velocidad_salto;
		audio_play_sound(snd_salto,1,false);
	}



if (!var_en_el_suelo && var_key_attack && sprite_index == var_sprite_saltando && var_obj_arma != noone) // ataque en el aire
{																								if is_debug_overlay_open() show_debug_message("Ataque en el aire");
	sprite_index = var_sprite_saltando_ataque;
	image_speed = 1;
	var_velocidad_vertical = var_velocidad_salto;
}

	// colision horizontal
	if (place_meeting(x+var_velocidad_horizontal,y,layer_tilemap_get_id(obj_juego.tileset))) // si hay una colision a donde DEBERIA moverse..
	{																							if is_debug_overlay_open() show_debug_message("Colision horizontal");
		while (!place_meeting(x+sign(var_velocidad_horizontal),y,layer_tilemap_get_id(obj_juego.tileset)))
		{
			x += sign(var_velocidad_horizontal); // ...nos acercamos pixel por pixel
		}
		var_velocidad_horizontal = 0; // y nos paramos
	}
	x += var_velocidad_horizontal;



	// colision vertical
	if (place_meeting(x,y+var_velocidad_vertical,layer_tilemap_get_id(obj_juego.tileset)))
	{																							if is_debug_overlay_open() show_debug_message("Colision vertical");
		while (!place_meeting(x,y+sign(var_velocidad_vertical),layer_tilemap_get_id(obj_juego.tileset)))
		{
			y += sign(var_velocidad_vertical);
		}
		var_velocidad_vertical = 0;
	}
	y += var_velocidad_vertical;



	// animacion
	if (var_velocidad_horizontal != 0)
	{
		image_xscale = sign(var_velocidad_horizontal);
	}
	
	
	if (!var_en_el_suelo) // si NO en el suelo, cambiamos el sprite a saltando
	{																							if is_debug_overlay_open() show_debug_message("Sprite - no en el suelo");
		if (sprite_index != var_sprite_saltando_ataque)
		{
			sprite_index = var_sprite_saltando;
		}	
		else
		{
			if (animation_end())
			{
				image_speed = 0;
			}
		}
	}
	else
	{																							if is_debug_overlay_open() show_debug_message("Sprite - En el suelo");
		if (var_salud > 0)
		{																						if is_debug_overlay_open() show_debug_message("Sprite - salud > 0");
			if (var_velocidad_horizontal == 0)
			{																					if is_debug_overlay_open() show_debug_message("Sprite - quieto");
				sprite_index = var_sprite_quieto;
			}
			else
			{																					if is_debug_overlay_open() show_debug_message("Sprite - corriendo");
				image_speed = 1 // animacion habilitada para correr
				sprite_index = var_sprite_corriendo;
			}
		}//salud > 0
		else //salud <= 0
		{																						if is_debug_overlay_open() show_debug_message("Sprite - muerto");
			state = PLAYERSTATE.MUERTO;
		} 
	} //en el suelo



	if (var_en_el_suelo && var_key_attack && var_obj_arma != noone)
	{
		state = PLAYERSTATE.ATAQUE_SLASH;
	}
}