function EnemigoState_Movimiento(){

	var _en_un_borde = 0;
	var _en_una_pared = 0;
	
	if (instance_exists(obj_juego)) 
	{
		 if (image_xscale == 1)
			_en_un_borde = !place_meeting(bbox_right,y+1,layer_tilemap_get_id(obj_juego.tileset)); 
		 else
			_en_un_borde = !place_meeting(bbox_left,y+1,layer_tilemap_get_id(obj_juego.tileset)); 
		 _en_una_pared = place_meeting(x+(image_xscale * velocidad),y,layer_tilemap_get_id(obj_juego.tileset)); 
	}
	if !(_en_un_borde) && !(_en_una_pared)
	{
		x += image_xscale * velocidad;
	}
	else
	{
		state = ENEMIGOSTATE.ENUNBORDE;
	}
}