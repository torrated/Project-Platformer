function PlayerState_Ataque_Slash()
{
	image_speed = 1; 
	var_velocidad_horizontal = 0;
	var_velocidad_vertical = 0;
	
	// Inicio del ataque
	if (sprite_index != var_sprite_ataque) // si el sprite no es el de ataque significa que empezamos a atacar en este frame
	{																		if is_debug_overlay_open() show_debug_message("Inicio del ataque");
		sprite_index = var_sprite_ataque; //cambio del sprite
		image_index = 0; //reinicio de la animacion
		ds_list_clear(hit_by_attack); //reinicio de la lista de enemigos golpeados
	}
	
	
	//Uso del hitbox y comprobacion de golpes
	mask_index = var_sprite_ataqueHB;
	var _hitByAttackNow = ds_list_create(); //lista de los enemigos siendo golpeados con este ataque
	var _hits = instance_place_list(x,y,obj_enemigos_parent,_hitByAttackNow,false); // si true, la lista viene ordenada de mas cercano a mas lejano
	if (_hits > 0) //significa que hemos golpeado algo
	{																		if is_debug_overlay_open() show_debug_message("Hemos golpeado algo");
		for (var _i = 0; _i < _hits; _i++)
		{
			var _hitID = _hitByAttackNow[| _i]; // busca si este objetivo ya esta en la lista para saber si ya le habiamos golpeado
			if (ds_list_find_index(hit_by_attack,_hitID) == -1) //no esta en la lista
			{
				ds_list_add(hit_by_attack,_hitID);
				EnemigoState_Golpeado(_hitID);
			}
		}
	}
	
	ds_list_destroy(_hitByAttackNow);
	mask_index = var_sprite_quieto;
	
	if (animation_end()) //si se acaba la animacion entonces volvemos al estado libre
	{																		if is_debug_overlay_open() show_debug_message("Fin de la animación de ataque");
		sprite_index = var_sprite_quieto;
		state = PLAYERSTATE.LIBRE;
	}
} //end function