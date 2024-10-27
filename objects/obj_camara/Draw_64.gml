/// @description Presiona SALTO para cancelar

if (instance_exists(obj_juego)) && (obj_juego.scroll_inicial)
{
	var _color = draw_get_color();
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	var _font = draw_get_font();
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	draw_set_font(fnt_timer);
	draw_text(display_get_gui_width()/2,display_get_gui_height()-20,global.texto_press_space[global.idioma])

	//draw_set_halign(fa_left);
	//draw_set_valign(fa_top);
	draw_set_color(_color);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_font(_font);
}