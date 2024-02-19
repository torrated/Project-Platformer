/// @description State Machine

state = ENTIDAD.CAMINANDO;
hit_by_attack = ds_list_create(); //lista de enemigos que han sido atacados por el actual ataque (para no golpear dos veces)
velocidad_horizontal=velocidad_caminar;
enum ENTIDAD
{
	CAMINANDO,
	QUIETO,
	SALTANDO,
	ATACANDO,
	GOLPEADO,
	MURIENDO,
	MUERTO
}