/// @description Golpeado por un enemigo

if !(state == PLAYERSTATE.MUERTO) && !(var_golpeado)
{
	state = PLAYERSTATE.GOLPEADO;
}