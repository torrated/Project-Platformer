/// @description On Screen info

if (var_debug_mode)
{
	var _estado = noone;
	switch (obj_player_parent.state)
	{
		case 0: _estado = "LIBRE"; break;
		case 1: _estado = "ATAQUE_SLASH"; break;
		case 2: _estado = "ATAQUE_COMBO"; break;
		case 3: _estado = "MUERTO"; break;
		case 4: _estado = "GOLPEADO"; break;
		case 5: _estado = "QUIETO"; break;
	}
	draw_set_font(fnt_debug);
	draw_set_color(c_white);
	var _i := 85;
	draw_text(700,_i,"DEBUG MODE"); _i += 10;
	draw_text(700,_i,"FPS: " + string(fps)); _i += 10;
	draw_text(700,_i,"obj_player.state: " + _estado);  _i += 10;
	
	draw_text(700,_i,"global.gamepad: " + string(global.gamepad)); _i += 10;
	draw_text(700,_i,"gamepad_is_connected(0): " + string(gamepad_is_connected(0))); _i += 10;	
	
	draw_text(700,_i,""); _i += 10;

	draw_text(700,_i,"global.enter: "+string(global.enter)); _i += 10;
	draw_text(700,_i,"global.pausa: "+string(global.pausa)); _i += 10;

}
