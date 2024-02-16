/// @description State Machine

state = PLAYERSTATE.LIBRE;
hit_by_attack = ds_list_create(); //lista de enemigos que han sido atacados por el ataque (para no golpear dos veces)

enum PLAYERSTATE
{
	LIBRE,
	ATAQUE_SLASH,
	ATAQUE_COMBO,
	MUERTO,
	GOLPEADO
}