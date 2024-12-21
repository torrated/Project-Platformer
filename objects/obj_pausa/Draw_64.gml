/// @description Menú pausa

if (idioma) que_menu_muestro = global.texto_menuidiomaaudio_opciones;
else if (volumen) que_menu_muestro = global.texto_menuaudio_opciones;
	else que_menu_muestro = global.texto_menupausa_opciones;

if (pausa)
{
	var _font = draw_get_font();
	var _color = draw_get_color();
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	draw_set_font(fnt_menuprincipal);

	draw_set_color(c_white);
	draw_text_transformed(display_get_gui_width()/2,display_get_gui_height()/2,global.texto_pausa[global.idioma],0.5,0.5,0);
	
	var _i = 0;
	repeat (array_length(que_menu_muestro))
	{
		if (_i == menupausa_seleccion) draw_set_color(c_white);
		else draw_set_color(c_black);
		if (volumen)
			switch (_i)
			{
				case 0: draw_text_transformed(display_get_gui_width()/2,display_get_gui_height()/2+interlineado*(_i+2),que_menu_muestro[_i][global.idioma]+" "+string(global.volumen_musica),0.5,0.5,0); break;
			    case 1: draw_text_transformed(display_get_gui_width()/2,display_get_gui_height()/2+interlineado*(_i+2),que_menu_muestro[_i][global.idioma]+" "+string(global.volumen_audio),0.5,0.5,0); break;
			    default: draw_text_transformed(display_get_gui_width()/2,display_get_gui_height()/2+interlineado*(_i+2),que_menu_muestro[_i][global.idioma],0.5,0.5,0); break;
			}
		else
			draw_text_transformed(display_get_gui_width()/2,display_get_gui_height()/2+interlineado*(_i+2),que_menu_muestro[_i][global.idioma],0.5,0.5,0);
		_i++;
	}

	draw_set_font(_font);
	draw_set_color(_color);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}
