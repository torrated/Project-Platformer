function BossState_Movimiento()
{
	velocidad = 2.5;
	
	if (estado_iniciado <> BOSSSTATE.MOVIMIENTO)
	{
		estado_iniciado = BOSSSTATE.MOVIMIENTO;
		
		x_inicial = x;
		x_final = camera_get_view_x(view_camera[1])+(sprite_width/2)+(obj_player_parent.bbox_right-obj_player_parent.bbox_left)+5;
		x_final = camera_get_view_x(view_camera[1]); // TESTING
		audio_play_sound(snd_spider_movimiento,1,false);
	}
	else
	{ 
		//secuencia de cosas a hacer
		if (image_xscale == 1) // si mira a la izquierda, se mueve a la izquierda
		{
			if (x > x_final)
				x -= velocidad;
			else
				image_xscale = -1; // al llegar al final, da la vuelta
		}
		else // mira a la derecha
		{
			if (x < x_inicial)
				x += velocidad;
			else
			{
				x = x_inicial;
				image_xscale = 1;
				estado_iniciado = -1;
				audio_stop_sound(snd_spider_movimiento);
			}
		}
		
		// fin de accion

	}
}