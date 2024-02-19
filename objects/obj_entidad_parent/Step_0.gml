///@description Selecciona el estado en la state machine

velocidad_vertical += obj_juego.gravedad;
en_el_suelo = place_meeting(x,y+2,layer_tilemap_get_id(obj_juego.tileset));



switch (state)
{
	case ENTIDAD.CAMINANDO: Entidad_Caminando(); break;
	case ENTIDAD.QUIETO: Entidad_Quieto(); break;
	case ENTIDAD.SALTANDO: Entidad_Saltando(); break;
	case ENTIDAD.ATACANDO: Entidad_Atacando(); break;
	case ENTIDAD.GOLPEADO: Entidad_Golpeado(); break;
	case ENTIDAD.MURIENDO: Entidad_Muriendo(); break;
	case ENTIDAD.MUERTO: Entidad_Muerto(); break;
}