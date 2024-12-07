function PlayerState_Libre()
{ // mira a ver de usar move_and_collide()
	// calcular movimiento horizontal
	if (obj_player_parent.var_puede_leer_input)
	{
		obj_player_parent.image_speed = 1;
		var _var_move = obj_player_parent.var_movimiento;
		if (var_key_run)
			obj_player_parent.var_velocidad_horizontal = _var_move * obj_player_parent.var_velocidad_correr;
		else
			obj_player_parent.var_velocidad_horizontal = _var_move * obj_player_parent.var_velocidad_caminar;
	}


	obj_player_parent.var_velocidad_vertical += var_gravedad;
	
	if (obj_player_parent.var_puede_saltar > 0) && (obj_player_parent.var_key_jump) // si puede saltar y se presiona saltar
	{
		obj_player_parent.var_velocidad_vertical = obj_player_parent.var_velocidad_salto;
		audio_play_sound(snd_salto,1,false,global.volumen_audio/10,0,random_range(0.98,1.02));
		obj_player_parent.var_puede_saltar = 0;
	}



if (!obj_player_parent.var_en_el_suelo && obj_player_parent.var_key_attack && obj_player_parent.sprite_index == obj_player_parent.var_sprite_saltando && obj_player_parent.var_obj_arma != noone) // ataque en el aire
{
	obj_player_parent.sprite_index = obj_player_parent.var_sprite_saltando_ataque;
	obj_player_parent.image_speed = 1;
	obj_player_parent.var_velocidad_vertical = obj_player_parent.var_velocidad_salto;
}

	// colision horizontal
	if (instance_exists(obj_juego)) && (place_meeting(x+obj_player_parent.var_velocidad_horizontal,obj_player_parent.y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible])) // si hay una colision a donde DEBERIA moverse..
	{
		while (!place_meeting(obj_player_parent.x+sign(obj_player_parent.var_velocidad_horizontal),obj_player_parent.y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible]))
		{
			obj_player_parent.x += sign(obj_player_parent.var_velocidad_horizontal); // ...nos acercamos pixel por pixel
		}
		obj_player_parent.var_velocidad_horizontal = 0; // y nos paramos
	}
	obj_player_parent.x += obj_player_parent.var_velocidad_horizontal;


	// colision vertical
		// raycasting hacia arriba para sortear esquinas
		if (instance_exists(obj_juego)) && (instance_exists(obj_player_parent))
		{
			var _raycast_left =  collision_line(bbox_left,bbox_top,bbox_left,bbox_top+obj_player_parent.var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true);
			var _raycast_middle =  collision_line((bbox_right+bbox_left)/2,bbox_top,(bbox_right+bbox_left)/2,bbox_top+obj_player_parent.var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true);
			var _raycast_right =  collision_line(bbox_right,bbox_top,bbox_right,bbox_top+obj_player_parent.var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true);

			if (_raycast_left || _raycast_middle || _raycast_right)
			{
				if (_raycast_left) && (_raycast_middle) {}; // nada
				if (_raycast_right) && (_raycast_middle) {}; // nada
			
				if (_raycast_left) && !(_raycast_middle)
				{
					for (var _i = bbox_left; _i <= bbox_right; _i++)
					{
						if (collision_line(_i,bbox_top,_i,bbox_top+obj_player_parent.var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true))
						{
							x += 1;
						}
					}
				}

				if (_raycast_right) && !(_raycast_middle)
				{
					for (var _i = bbox_right; _i >= bbox_left; _i--)
					{
						if (collision_line(_i,bbox_top,_i,bbox_top+obj_player_parent.var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,true))
						{
							x -= 1;
						}
					}
				}
			}
		} // end instance exists / end raycasting
		
	if (instance_exists(obj_juego)) && ((place_meeting(x,y+obj_player_parent.var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible])) || ((place_meeting(x,y+var_velocidad_vertical,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible])) && (var_velocidad_vertical>0)))
	{
		while (!place_meeting(x,y+sign(obj_player_parent.var_velocidad_vertical),[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible]))
		{
			y += sign(obj_player_parent.var_velocidad_vertical);
		}
		obj_player_parent.var_velocidad_vertical = 0;
	}
	y += obj_player_parent.var_velocidad_vertical;

	//BUGFIX: al volver de la pausa el personaje está hundido 0.4 pixeles y se atasca
		while (var_velocidad_vertical = 0) && (place_meeting(x,y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible]))
		{
			y -= 1;
		}


	// animacion
	if (var_velocidad_horizontal != 0)
	{
		image_xscale = sign(var_velocidad_horizontal);
		if ((x % 12 == 0) && (var_en_el_suelo)) // solo ponemos polvo cada varios pixels para no sobrecargar
		{
			var _polvo = instance_create_depth(x-var_velocidad_horizontal,y-4,depth,obj_polvo);
		}
	}
	
	
	if (!var_en_el_suelo) // si NO en el suelo, cambiamos el sprite a saltando
	{
		if (y > room_height+sprite_height) state = PLAYERSTATE.MUERTO;
		
		if (sprite_index != var_sprite_saltando_ataque)
		{
			sprite_index = var_sprite_saltando;
			image_xscale = sign(image_xscale);
			image_yscale = sign(image_yscale);
			image_speed = 0;
			image_index = var_salto_airborne;

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
				image_xscale = sign(image_xscale)/2;
				image_yscale = sign(image_yscale)/2;
			}
			else
			{
				image_speed = 1 // animacion habilitada para correr
				sprite_index = var_sprite_corriendo;
				image_xscale = sign(image_xscale)/2;
				image_yscale = sign(image_yscale)/2;
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