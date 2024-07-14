/// @description Presiona SALTO para cancelar

if (instance_exists(obj_juego)) && (obj_juego.scroll_inicial)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	draw_text(display_get_gui_width()/2,display_get_gui_height()-20,global.texto_press_space[global.idioma])

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}