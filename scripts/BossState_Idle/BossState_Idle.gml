function BossState_Idle()
{	
	if (estado_iniciado <> BOSSSTATE.IDLE)
	{
		estado_iniciado = BOSSSTATE.IDLE;
		contador_timer = irandom_range(30,90); //tiempo aleatorio entre 0.5 y 1.5 segundos
	}
	else
	{ 
		//secuencia de cosas a hacer
		
		// fin de accion
		if (contador_timer == 0)
			estado_iniciado = -1;
		else
			contador_timer -= 1;
	}
}