//@description ejecuta el fundido a negro cuando el jugador muere

function script_muerte(_accion)
{
	if !(obj_animaciones.animacion_iniciada)
	{
		obj_animaciones.animacion_iniciada = true;

		// variables para el fundido a negro
		i_fundido = 0; // posicion del fundido
		fundido_size = 120; // tamaño del fundido
		fundido_increase = 0.5; // velocidad del fundido
		fin_de_fundido = false; // para saber cuándo termina el fundido
	
		
		// para la musica
		if (audio_is_playing(global.musica))
			audio_stop_sound(global.musica);
	}
	else 
	{
		if !(fin_de_fundido) // para dibujar la animacion de fundido
		{
			if (i_fundido >= fundido_size) 
			{
				fin_de_fundido = true;
			}
			
			draw_set_color(c_black);
			for (_i = 0; _i <= i_fundido; _i++)
				draw_circle(obj_player_parent.x, obj_player_parent.y, 150-_i, true);
			
			i_fundido += fundido_increase;
		}
		else //el fundido ha terminado
		{
			obj_animaciones.animacion_iniciada = false;
			switch (_accion)
			{
				case "restart": room_restart(); break; // se reinicia la fase
				case "menu": room_goto(0); break; // va al menu principal
			}
		}
	}
}