/// @description Menú pausa

if (idioma) que_menu_muestro = global.texto_menuidioma_opciones;
else que_menu_muestro = global.texto_menupausa_opciones;

if (pausa)
{
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);

	draw_set_font(fnt_pausa);

	draw_set_color(c_white);
	draw_text(display_get_gui_width()/2,display_get_gui_height()/2,global.texto_pausa[global.idioma]);
	
	var _i = 0;
	repeat (array_length(que_menu_muestro))
	{
		if (_i == menupausa_seleccion) draw_set_color(c_white);
		else draw_set_color(c_black);
		draw_text(display_get_gui_width()/2,display_get_gui_height()/2+interlineado*(_i+2),que_menu_muestro[_i][global.idioma]);
		_i++;
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
