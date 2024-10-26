function BossState_Damaged(_boss = obj_enemigos_parent)
{
	if (_boss.estado_iniciado <> BOSSSTATE.DAMAGED)
	{
		_boss.estado_iniciado = BOSSSTATE.DAMAGED;
		contador_timer = 60; // 1.5 segundos

		if (_boss.vidas) > 0
			audio_play_sound(snd_hit,1,false);
		
	}
	else
	{ 
		_boss.var_flash = contador_timer % 2;
		// fin de accion
		if (contador_timer == 0)
		{
			_boss.estado_iniciado = state_anterior;
			_boss.state = state_anterior;
			_boss.var_flash = 0;
		}
		else
			contador_timer -= 1;
	}
}