function BossState_Ataque_1(_boss  = obj_enemigos_parent)
{
	if (_boss.estado_iniciado <> BOSSSTATE.ATAQUE1)
	{
		_boss.estado_iniciado = BOSSSTATE.ATAQUE1;
		minion = noone;
		minions_lanzados = 0;
		minions_a_lanzar = irandom_range(1,4); //lanza un numero aleatorio de arañas entre 1 y 4
	}
	else
	{ 
		//bucle
		if (minions_lanzados < minions_a_lanzar)
		{
			//crea una araña en el frame correcto si no existe ninguna araña
			if !(instance_exists(minion)) 
			{
				if (_boss.sprite_index != _boss.sprite_ataque_1)
				{
					_boss.sprite_index = _boss.sprite_ataque_1;
				}
				if ((floor(_boss.image_index) == 6) && (_boss.sprite_index == _boss.sprite_ataque_1))
				{
					minion = instance_create_layer(x,y,"Enemigos",obj_spider_mueve);
					if (minion.image_xscale == 1)
						minion.image_xscale = -1;
					minion.velocidad = 4 * minion.velocidad; // velocidad aumentada
					minion.destruir_al_salir = true;
					minion.destruir_al_salir_x = camera_get_view_x(view_camera[1]);
					minions_lanzados += 1;
				}
			}

			if (instance_exists(minion))
			{
				if (floor(_boss.image_index) == 0)
				{
					if (_boss.sprite_index == _boss.sprite_ataque_1)
					{
						_boss.sprite_index = _boss.sprite_idle;
						_boss.overwrite = true; // para que el draw event no cambie el sprite basado en STATE
					}
				}
			}
		}
		else
		{ // fin de accion al terminar el ciclo de frames
			if (floor(_boss.image_index) == 0)
			{
				_boss.estado_iniciado = -1;
				_boss.image_speed = 1;
				_boss.overwrite = false;
			}
		}
	}
}