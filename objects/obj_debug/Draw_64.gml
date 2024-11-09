/// @description On Screen info

if (var_debug_mode)
{
	var _estado = noone;

	//switch (obj_player_parent.state)
	//{
	//	case 0: _estado = "LIBRE"; break;
	//	case 1: _estado = "ATAQUE_SLASH"; break;
	//	case 2: _estado = "ATAQUE_COMBO"; break;
	//	case 3: _estado = "MUERTO"; break;
	//	case 4: _estado = "GOLPEADO"; break;
	//	case 5: _estado = "QUIETO"; break;
	//}
	var _font = draw_get_font();
	var _color = draw_get_color();
	draw_set_font(fnt_debug);
	draw_set_color(c_white);
	var _i := 85;
	var _height = 15;
	draw_text(700,_i,"DEBUG MODE"); _i += _height;
	draw_text(700,_i,"FPS: " + string(fps)); _i += _height;
	//draw_text(700,_i,"obj_player.state: " + _estado);  _i += _height;
	draw_text(700,_i,"instance_count: " + string(instance_count));  _i += _height;
	
	draw_text(700,_i,"global.gamepad: " + string(global.gamepad)); _i += _height
	draw_text(700,_i,"gamepad_is_connected(0): " + string(gamepad_is_connected(0))); _i += _height;	
	
	draw_text(700,_i,""); _i += _height;

	draw_text(700,_i,"global.secuencia_iniciada: "+string(global.secuencia_iniciada)); _i += _height;
	
	draw_text(700,_i,"obj_vidas.vidas: "+string(obj_vidas.vidas)); _i += _height;
	
	draw_text(700,_i,"obj_persistente.var_monedas: "+string(obj_persistente.var_monedas)); _i += _height;
	draw_text(700,_i,"obj_persistente.var_timer: "+string(obj_persistente.var_timer)); _i += _height;

	draw_set_font(_font);
	draw_set_color(_color);
}
