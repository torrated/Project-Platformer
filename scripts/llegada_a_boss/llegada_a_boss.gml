//@description ejecuta la cinemática de llegada al boss:

/*
Secuencia:
 1.- el personaje se detiene
 2.- salen barras negras arriba y abajo
 3.- pequeña pausa
 4.- la cámara se queda fija
 5.- la cámara se desplaza a la derecha
 6.- se ve al boss, que ejecuta una animación
 7.- desaparecen las barras
 8.- se crea muro invisible a la izquierda y a la derecha
 9.- el personaje puede moverse
 10.- el boss puede moverse
*/

function llegada_a_boss(boss = obj_enemigos_parent)
{
	if !(global.secuencia_iniciada)
	{
		global.secuencia_iniciada = true;
		
		// 1.- el personaje se detiene
		if (instance_exists(obj_player_parent))
		{
			obj_player_parent.state = PLAYERSTATE.QUIETO;
		}
	
		
		// variables para el fundido a negro
		i_fundido = 0; // posicion del fundido
		fundido_size = 100; // tamaño del fundido
		fundido_increase = 3; // velocidad del fundido
		fin_de_fundido = false; // para saber cuándo termina el fundido
		pintar_barras = true; // para pintar barras hasta el paso en que las eliminamos
		
		// variables para el desplazamiento de la cámara
		i_desplazamiento = 0;
		desplazamiento_increase = 1; // velocidad del movimiento
		fin_del_desplazamiento = false; // para saber cuándo ha terminado
		
		// variables para la pausa
		fin_de_la_pausa = false;
		i_pausa = 0;
		size_pausa = 66;
		incremento_pausa = 1; // velocidad
		
		// variables para la animacion del boss
		fin_de_la_animacion = false;
		i_animacion = 0;
		size_animacion = 60;
		incremento_animacion = 1;
		
		// variables para el desfundido
		i_desfundido = fundido_size;
		desfundido_size = 0;
		desfundido_increase = fundido_increase;
		fin_de_desfundido = false;
		
		// variable para alejar la camara si hace falta
		if (instance_exists(obj_camara))
		{
			obj_camara.alejar = true;
		}
		
		// para la musica e inicia una nueva
		if (instance_exists(obj_juego))
		{
			if (audio_is_playing(obj_juego.musica))
			{
				audio_stop_sound(obj_juego.musica);
				obj_juego.musica = audio_play_sound(Web_of_Shadows,1,true);
			}
		}
	}
	else // si secuencia ya está iniciada
	{
		if !(fin_de_fundido) // para dibujar la animacion de fundido
		{
			// 2.- salen barras negras arriba y abajo
			if (i_fundido >= fundido_size) 
			{
				fin_de_fundido = true;
			}
			
			draw_set_color(c_black);
			draw_rectangle(0,0,display_get_gui_width(),i_fundido,false);
			draw_rectangle(0,display_get_gui_height(),display_get_gui_width(),display_get_gui_height()-i_fundido,false);
			i_fundido += fundido_increase;
		}
		else //el fundido ha terminado y hay que dibujarlo entero y seguir la secuencia
		{
			if (pintar_barras)
			{
				draw_set_color(c_black);
				draw_rectangle(0,0,display_get_gui_width(),i_fundido,false);
				draw_rectangle(0,display_get_gui_height(),display_get_gui_width(),display_get_gui_height()-i_fundido,false);
			}
			
			// 3.- pequeña pausa
			if !(fin_de_la_pausa)
			{
				if (i_pausa >= size_pausa)
				{
					fin_de_la_pausa = true;
				}
				else
				{
					i_pausa += incremento_pausa;
				}
			}
			else
			{
				// 4.- la cámara se queda fija
				if (view_get_visible(0))
				{
					camara_x_inicial = camera_get_view_x(view_camera[0]);
					size_desplazamiento = camera_get_view_width(view_camera[0])/4;
				
					view_set_visible(0, false); //deshabilita la cámara (viewport actual)
					view_set_visible(1, true); //habilita la nueva cámara (viewport)
	
					camera_set_view_pos(view_camera[1],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])); // la nueva cámara copia la posicion y tamaño de la cámara anterior
					camera_set_view_size(view_camera[1],camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]));
				}
				// 5.- la cámara se desplaza a la derecha
				if !(fin_del_desplazamiento)
				{
					if (i_desplazamiento >= size_desplazamiento)
					{
						fin_del_desplazamiento = true;
					}
					else
					{
						camera_set_view_pos(view_camera[1],camara_x_inicial+i_desplazamiento,camera_get_view_y(view_camera[1]));
						i_desplazamiento += desplazamiento_increase;
					}
				}
				else
				{
					// 6.- se ve al boss, que ejecuta una animación
					if !(fin_de_la_animacion)
					{
						if (i_animacion >= size_animacion)
						{
							fin_de_la_animacion = true;
						}
						else
						{
							i_animacion += incremento_animacion;
						}
					}
					else
					{
						pintar_barras = false;
						
						// 7.- desaparecen las barras
						if !(fin_de_desfundido) // para dibujar la animacion de desfundido
						{
							if (i_desfundido <= desfundido_size) 
							{
								fin_de_desfundido = true;
							}
							draw_set_color(c_black);
							draw_rectangle(0,0,display_get_gui_width(),i_desfundido,false);
							draw_rectangle(0,display_get_gui_height(),display_get_gui_width(),display_get_gui_height()-i_desfundido,false);
							i_desfundido -= desfundido_increase;
						}
						else
						{
							// 8.- se crea muro invisible a la izquierda y a la derecha
							instance_create_layer(6218,320,"Player",obj_muro_invisible,{
							    image_yscale : 4
							});
							

							// 9.- el personaje puede moverse
							if (instance_exists(obj_player_parent))
							{
								obj_player_parent.state = PLAYERSTATE.LIBRE;
								obj_player_parent.var_puede_leer_input = true;
							}
							
							// 10.- el boss puede moverse
							boss.estado_iniciado = -1;
							
	
							// .- fin del script
							if (instance_exists(obj_trigger_muro_invisible))
							{
								obj_trigger_muro_invisible.ejecuta_secuencia = false;
							}
							global.secuencia_iniciada = false;
						}
					}
				}
			}
		}
	}	
}