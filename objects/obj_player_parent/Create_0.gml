/// @description State Machine y control

state = PLAYERSTATE.LIBRE;
hit_by_attack = ds_list_create(); //lista de enemigos que han sido atacados por el ataque (para no golpear dos veces)

keybuffer_salto = 0;
keybuffer_salto_init = 5;

enum PLAYERSTATE
{
	LIBRE,
	ATAQUE_SLASH,
	ATAQUE_COMBO,
	MUERTO,
	GOLPEADO,
	QUIETO
}