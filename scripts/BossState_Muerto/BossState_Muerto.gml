function BossState_Muerto(_boss = obj_boss_spider)
{
	if (estado_iniciado <> BOSSSTATE.MUERTO)
	{
		estado_iniciado = BOSSSTATE.MUERTO;
		_boss.image_index = 1;
		if (audio_is_playing(obj_juego.musica))
		{
			audio_stop_sound(obj_juego.musica);
		}
		audio_play_sound(snd_derrota_jefe,1,false);
	}
	else
	{ 
		if (_boss.image_index >= _boss.image_number - 1) // si el frame es el último de la animacion
		{
			_boss.mask_index = -1;
			_boss.image_speed = 0;
			obj_trigger_fin_fase.activado = true;
		}
	}

}