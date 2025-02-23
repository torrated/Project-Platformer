/// @description Dibuja el HUD

// Corazones
for (var _i = 0; _i < obj_player_parent.var_salud; _i++)
{
	draw_sprite_ext(spr_hud_corazon,0,32+(_i*64),32,2,2,0,c_white,1);
}


//efecto de subir un corazón
if (sube_corazon)
{
	if (efecto_corazon_i > 0)
	{
		draw_sprite_ext(spr_hud_corazon,0,32+((obj_player_parent.var_salud-1)*64),32,2+3*(efecto_corazon_i/efecto_corazon),2+3*(efecto_corazon_i/efecto_corazon),0,c_white,1);
		efecto_corazon_i -= 1;
	}
	else
	{
		efecto_corazon_i = efecto_corazon;
		sube_corazon = false;
	}
}



// Monedas
draw_sprite_ext(spr_moneda,0,830,55,3,3,0,c_white,1);
var _font = draw_get_font();
var _color = draw_get_color();
draw_set_font(fnt_menuprincipal);

draw_set_color(c_white);
draw_text_transformed(870,16,string(obj_juego.var_monedas)+"/100",0.75,0.75,0);

draw_set_font(_font);
draw_set_color(_color);



// Tiempo
draw_sprite_ext(spr_reloj,0,430,10,2,2,0,c_white,1);
_font = draw_get_font();
_color = draw_get_color();
draw_set_font(fnt_menuprincipal);

draw_set_color(c_white);
draw_text_transformed(500,12,obj_juego.timer,0.75,0.75,0);
draw_set_font(_font);
draw_set_color(_color);



// Vidas
draw_sprite_ext(spr_hud_cabeza,0,82+20*(obj_vidas.vidas div 10),720,3.5,3.5,0,c_white,1);
_font = draw_get_font();
_color = draw_get_color();
draw_set_font(fnt_menuprincipal);

draw_set_color(c_white);
draw_text_transformed(17,701,string_concat(obj_vidas.vidas,"x"),0.67,0.67,0);
draw_set_font(_font);
draw_set_color(_color);
//efecto de subir una vida
if (sube_vida)
{
	if (efecto_vida_i > 0)
	{
		draw_sprite_ext(spr_hud_cabeza,0,82+20*(obj_vidas.vidas div 10),720,3.5+3*(efecto_vida_i/efecto_vida),3.5+3*(efecto_vida_i/efecto_vida),0,c_white,1);
		efecto_vida_i -= 1;
	}
	else
	{
		efecto_vida_i = efecto_vida;
		sube_vida = false;
	}
}


// Arma actual
if (obj_player_parent.var_obj_arma == noone)
{
	//draw_sprite_ext(spr_hud_arma,0,982,720,1,1,0,c_white,1);
}
else
{
	draw_sprite_ext(asset_get_index(string_replace(object_get_name(obj_player.var_obj_arma),"obj_","spr_hud_")),0,982,720,1,1,0,c_white,1);
}



// Go!
var scr_go = function()
{
	go_counter--; 
	var _halign = draw_get_halign();
	var _valign = draw_get_valign();
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed_color(display_get_gui_width()/2,display_get_gui_height()/2,"Go!",go_counter_start-go_counter,go_counter_start-go_counter,0,c_red,c_white,c_yellow,c_blue,go_counter/go_counter_start);
	
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

if (go) && (go_counter >= 0)
{
	scr_go();
}



//barras negras a los lados
draw_set_color(c_black);
draw_rectangle(0,0,-120,display_get_gui_height(),false);
draw_rectangle(display_get_gui_width(),0,display_get_gui_width()+120,display_get_gui_height(),false);