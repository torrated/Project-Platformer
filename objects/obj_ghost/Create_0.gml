/// @description StateMachine

enum GHOSTSTATE
{
	LEERFICHERO,
	GRABAR,
	GUARDARFICHERO,
	REPRODUCIR,
	DETENER
}

index = 0;
fichero_ghost = "ghost.ini";
reproducir = false;
grabar = false;

state = GHOSTSTATE.LEERFICHERO;