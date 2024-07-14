function PlayerState_Libre()
{ // mira a ver de usar move_and_collide()
	// calcular movimiento horizontal
	if (var_puede_leer_input)
	{
		var _var_move = var_movimiento;
		if (var_key_run)
			var_velocidad_horizontal = _var_move * var_velocidad_correr;
		else
			var_velocidad_horizontal = _var_move * var_velocidad_caminar;
	}


	var_velocidad_vertical += var_gravedad;
	
	if (var_puede_saltar > 0) && (var_key_jump) // si puede saltar y se presiona saltar
	{
		var_velocidad_vertical = var_velocidad_salto;
		audio_play_sound(snd_salto,1,false);
		var_puede_saltar = 0;
	}



if (!var_en_el_suelo && var_key_attack && sprite_index == var_sprite_saltando && var_obj_arma != noone) // ataque en el aire
{
	sprite_index = var_sprite_saltando_ataque;
	image_speed = 1;
	var_velocidad_vertical = var_velocidad_salto;
}

	// colision horizontal
	if (instance_exists(obj_juego)) && (place_meeting(x+var_velocidad_horizontal,y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible])) // si hay una colision a donde DEBERIA moverse..
	{
		while (!place_meeting(x+sign(var_velocidad_horizontal),y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible]))
		{
			x += sign(var_velocidad_horizontal); // ...nos acercamos pixel por pixel
		}
		var_velocidad_horizontal = 0; // y nos paramos
	}
	x += var_velocidad_horizontal;


	// colision vertical
		// raycasting	
		if (instance_exists(obj_juego)) && (instance_exists(obj_player_parent))
		{
			var _raycast_left =  collision_line(bbox_left,bbox_top,bbox_left,bbox_top+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true);
			var _raycast_middle =  collision_line((bbox_right+bbox_left)/2,bbox_top,(bbox_right+bbox_left)/2,bbox_top+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true);
			var _raycast_right =  collision_line(bbox_right,bbox_top,bbox_right,bbox_top+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true);

			if (_raycast_left || _raycast_middle || _raycast_right)
			{
				if (_raycast_left) && (_raycast_middle) {}; // nada
				if (_raycast_right) && (_raycast_middle) {}; // nada
			
				if (_raycast_left) && !(_raycast_middle)
				{
					for (var _i = bbox_left; _i <= bbox_right; _i++)
					{
						if (collision_line(_i,bbox_top,_i,bbox_top+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true))
						{
							x += 1;
						}
					}
				}

				if (_raycast_right) && !(_raycast_middle)
				{
					for (var _i = bbox_right; _i >= bbox_left; _i--)
					{
						if (collision_line(_i,bbox_top,_i,bbox_top+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true))
						{
							x -= 1;
						}
					}
				}
			}
		} // end instance exists
		
	if (instance_exists(obj_juego)) && ((place_meeting(x,y+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible])) || ((place_meeting(x,y+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible])) && (var_velocidad_vertical>0)))
	{
		while (!place_meeting(x,y+sign(var_velocidad_vertical),[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible]))
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
	{
		if (y > room_height+sprite_height) state = PLAYERSTATE.MUERTO;
		
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
	{
		if (var_salud > 0)
		{
			if (var_velocidad_horizontal == 0)
			{
				sprite_index = var_sprite_quieto;
			}
			else
			{
				image_speed = 1 // animacion habilitada para correr
				sprite_index = var_sprite_corriendo;
			}
		}//salud > 0
		else //salud <= 0
		{
			state = PLAYERSTATE.MUERTO;
		} 
	} //en el suelo



	if (var_en_el_suelo && var_key_attack && var_obj_arma != noone)
	{
		state = PLAYERSTATE.ATAQUE_SLASH;
	}
}