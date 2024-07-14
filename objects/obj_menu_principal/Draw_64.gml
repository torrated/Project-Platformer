/// @description Menu principal

if (opciones) que_menu_muestro = global.texto_menuprincipal_menuopciones;
else que_menu_muestro = global.texto_menuprincipal_opciones;

draw_set_font(fnt_menuprincipal);

var _i = 0;
repeat (array_length(que_menu_muestro))
{
	if (_i == menuprincipal_seleccion) draw_set_color(c_white);
	else draw_set_color(c_black);
	draw_text(650,380+(55*_i),que_menu_muestro[_i][global.idioma]);
	_i++;
}

if (eleccion)
{
	if (i_fundido >= display_get_gui_height()/2)
	{
		fin_de_fundido = true;
		room_goto_next();
	}
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(),i_fundido,false);
	draw_rectangle(0,display_get_gui_height(),display_get_gui_width(),display_get_gui_height()-i_fundido,false);
	i_fundido += 15;
}