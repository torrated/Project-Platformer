function BossState_Ataque_2(_boss  = obj_enemigos_parent)
{
	if (_boss.estado_iniciado <> BOSSSTATE.ATAQUE2)
	{
		_boss.estado_iniciado = BOSSSTATE.ATAQUE2;
		contador_inicial = irandom_range(40,70); // 60 = 1 segundo
		contador_timer = contador_inicial;
		spider_web = noone;
	}
	else
	{ 
		//crea una telaraña solamente 
		if !(instance_exists(spider_web))
		{
			if (_boss.sprite_index != _boss.sprite_ataque_2)
			{
				_boss.sprite_index = _boss.sprite_ataque_2;
			}
			if ((floor(_boss.image_index) == 6) && (_boss.sprite_index == _boss.sprite_ataque_2))
			{
				spider_web = instance_create_layer(x,y-20,"Enemigos",obj_spider_web);
				audio_play_sound(snd_shoot,1,false);

				spider_web.velocidad = -3;
			
				spider_web.x_izquierda = camera_get_view_x(view_camera[1]);
				spider_web.x_derecha = camera_get_view_x(view_camera[1])+camera_get_view_width(view_camera[1]);
			}
		}
		
		if (instance_exists(spider_web))
		{
			if (floor(_boss.image_index) == 0)
			{
				if (_boss.sprite_index == _boss.sprite_ataque_2)
				{
					_boss.sprite_index = _boss.sprite_idle;
					_boss.overwrite = true; // para que el draw event no cambie el sprite basado en STATE
				}
			}
		}
		
		
		// fin de accion
		if (contador_timer == 0)
		{
			if (floor(_boss.image_index) == 0)
			{
				_boss.estado_iniciado = -1;
				_boss.overwrite = false;
			}
		}
		else
		{
			contador_timer -= 1;
		}
	}
}