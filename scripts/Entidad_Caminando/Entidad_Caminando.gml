function Entidad_Caminando()
{ 
	// calculo vertical

	
		
	// calculo horizontal


		
	// movimiento y colisión
	 move_and_collide(velocidad_horizontal,
					  velocidad_vertical,
					  layer_tilemap_get_id(obj_juego.tileset)
					  );
	
	
	
	// comprobamos si estamos quietos
	if (velocidad_horizontal == 0) state = ENTIDAD.QUIETO;
		
	
	
	// sprite
	if (abs(velocidad_horizontal) > 0 && abs(velocidad_vertical) == 0) sprite_index = sprite_caminando;
}