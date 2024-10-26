function Boss_update_sprite(_overwrite = false){
	if !(_overwrite)
	{
		switch (state)
		{
			case BOSSSTATE.IDLE: sprite_index = sprite_idle; break;
			case BOSSSTATE.ATAQUE1: sprite_index = sprite_ataque_1; break;
			case BOSSSTATE.ATAQUE2: sprite_index = sprite_ataque_2; break;
			case BOSSSTATE.MOVIMIENTO: sprite_index = sprite_movimiento; break;
			case BOSSSTATE.DAMAGED: sprite_index = sprite_damaged; break;
			case BOSSSTATE.MUERTO: sprite_index = sprite_muerto; sprite_set_bbox(sprite_muerto,0,0,0,0);break;
		}
	}
}