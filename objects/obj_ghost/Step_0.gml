/// @description Seleccionar estado de la StateMachine

switch (state)
{
	case GHOSTSTATE.LEERFICHERO: GhostState_LeerFichero(); //break;
	case GHOSTSTATE.GRABAR: GhostState_Grabar(); //break;
	
	case GHOSTSTATE.REPRODUCIR: GhostState_Reproducir(); //break;
	
	case GHOSTSTATE.DETENER: break;
	case GHOSTSTATE.GUARDARFICHERO: GhostState_GuardarFichero(); break;
}

index++;