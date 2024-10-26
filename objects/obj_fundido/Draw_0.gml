/// @description dibuja los circulos

draw_self();

if (instance_exists(obj_vidas))
{
	if (obj_vidas.vidas == 0)
	{

		x = obj_player.x;
		y = obj_player.y;
		if !(secuencia_iniciada)
		{
			secuencia_iniciada = true;
			var_tamano = var_tamano_maximo;
		}
		if (secuencia_iniciada)
		{
			if (var_tamano > 1)
			{
				image_xscale = var_tamano;
				image_yscale = var_tamano;
				var_tamano -= var_velocidad_tamano;
			}
			else
			{
				if (var_pausa > 0)
					var_pausa -= 1;
				//get current values
				var _font = draw_get_font();
				var _color = draw_get_color();
				
				draw_set_font(fnt_debug);
				draw_set_color(c_white);
				
				draw_text_transformed(x+24, y-8, "Game Over" , 1, 1, 1);
				
				if (var_pausa <= 0)
				{
					draw_text_transformed(x+24, y+8, global.texto_gameover[global.idioma], 0.25, 0.25, 1);
					if (global.salto)
					{
						secuencia_iniciada = false;
						instance_destroy(self,true);
					}		
				}
				//resets previous values
				draw_set_font(_font);
				draw_set_colour(_color);
			}
		}	
	}
}