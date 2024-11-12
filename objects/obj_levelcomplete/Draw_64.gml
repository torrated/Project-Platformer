/// @description 

var _font = draw_get_font();
var _color = draw_get_color();
var _halign = draw_get_halign();
var _valign = draw_get_valign();
	
draw_set_font(fnt_menuprincipal);
draw_set_color(c_white);

draw_text(300,300,global.texto_level_complete[global.idioma]);
if (var_texto_num >= 1) // tiempo
{
	draw_sprite_ext(spr_reloj,0,400,400,2,2,0,c_white,1);
	draw_text(450,400,string(obj_persistente.var_timer));
}
if (var_texto_num >= 2) //monedas
{
	draw_sprite_ext(spr_moneda,0,410,520,3,3,0,c_white,1);
	draw_text(450,480,string(obj_persistente.var_monedas)+"/100");
}
if (var_texto_num >= 3) //vidas
{
	draw_sprite_ext(spr_hud_cabeza,0,410,580,4,4,0,c_white,1);
	draw_text(450,560,string(obj_vidas.vidas));
}
if (var_texto_num >= 4) // presione salto
	draw_text_transformed(450, 705, global.texto_press_jump[global.idioma], 0.25, 0.25, 0);


if (var_pausa > 0)
{
	var_pausa -= 1;
}
else
{
	var_pausa = var_pausa_inicial;
	var_texto_num += 1;
}

if ((global.salto) && (var_texto_num >= 4))
{
	room_goto(MenuPrincipal);
}