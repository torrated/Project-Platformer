///@descr Selecciona el estado en la state machine

// seleccionamos el estado
switch (state)
{
	case ENEMIGOSTATE.QUIETO: EnemigoState_Quieto(); break;
	case ENEMIGOSTATE.MOVIMIENTO: EnemigoState_Movimiento(); break;
	case ENEMIGOSTATE.ENUNBORDE: EnemigoState_EnUnBorde(); break;
}

if (destruir_al_salir)
{
	if (x <= destruir_al_salir_x)
		instance_destroy(self);
}