///@descr Selecciona el estado en la state machine

//if (instance_exists(obj_juego)) en_el_suelo = place_meeting(x,y+1,layer_tilemap_get_id(obj_juego.tileset));



// seleccionamos el estado
switch (state)
{
	case ENEMIGOSTATE.QUIETO: EnemigoState_Quieto(); break;
	case ENEMIGOSTATE.MOVIMIENTO: EnemigoState_Movimiento(); break;
	case ENEMIGOSTATE.ENUNBORDE: EnemigoState_EnUnBorde(); break;
}