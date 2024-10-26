/// @description Golpeado

if (other.puede_golpear)
{
	instance_destroy(other);
	vidas -= 1;
	if (vidas > 0)
	{
		state_anterior = state;
		state = BOSSSTATE.DAMAGED;
	}
	else
	{
		state = BOSSSTATE.MUERTO;
	}
}