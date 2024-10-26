///@descr Selecciona el estado en la state machine

if (estado_iniciado <> -2) //-2 significa que no estamos haciendo la secuencia 
{
	// seleccionamos el estado
	if !((state == BOSSSTATE.DAMAGED) || (state == BOSSSTATE.MUERTO)) 
	{
		if (state == BOSSSTATE.ATAQUE2)
			if (irandom(100) <= 25) // hay un 25% de probabilidad de lanzar otro ataque
				state = BOSSSTATE.ATAQUE2;
			else
				state = secuencia_ataque[contador_secuencia];
		else
			state = secuencia_ataque[contador_secuencia];
	}

	switch (state)
	{
		case BOSSSTATE.IDLE: BossState_Idle(); break;
		case BOSSSTATE.ATAQUE1: BossState_Ataque_1(object_index); break;
		case BOSSSTATE.ATAQUE2: BossState_Ataque_2(object_index); break;
		case BOSSSTATE.MOVIMIENTO: BossState_Movimiento(); break;
		case BOSSSTATE.DAMAGED: BossState_Damaged(object_index); break;
		case BOSSSTATE.MUERTO: BossState_Muerto(object_index); break;
	}

	if (estado_iniciado == -1)
	{
		if (contador_secuencia == (array_length(secuencia_ataque)-1))
			contador_secuencia = 0;
		else
			contador_secuencia += 1;
	}
}