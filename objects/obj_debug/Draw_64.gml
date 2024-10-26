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
	var _height = 15;
	draw_text(700,_i,"DEBUG MODE"); _i += _height;
	draw_text(700,_i,"FPS: " + string(fps)); _i += _height;
	draw_text(700,_i,"obj_player.state: " + _estado);  _i += _height;
	draw_text(700,_i,"instance_count: " + string(instance_count));  _i += _height;
	
	draw_text(700,_i,"global.gamepad: " + string(global.gamepad)); _i += _height
	draw_text(700,_i,"gamepad_is_connected(0): " + string(gamepad_is_connected(0))); _i += _height;	
	
	draw_text(700,_i,""); _i += _height;

	draw_text(700,_i,"global.secuencia_iniciada: "+string(global.secuencia_iniciada)); _i += _height;
	
	draw_text(700,_i,"obj_vidas.vidas: "+string(obj_vidas.vidas)); _i += _height;
	//draw_text(700,_i,"global.enter: "+string(global.enter)); _i += _height;
	//draw_text(700,_i,"global.pausa: "+string(global.pausa)); _i += _height;
	
	//draw_text(700,_i,"global.arriba: "+string(global.arriba)); _i += _height;
	//draw_text(700,_i,"global.abajo: "+string(global.abajo)); _i += _height;
	//draw_text(700,_i,"global.derecha: "+string(global.derecha)); _i += _height;
	//draw_text(700,_i,"global.izquierda: "+string(global.izquierda)); _i += _height
	//draw_text(700,_i,"global.salto: "+string(global.salto)); _i += _height;
	
	//draw_text(700,_i,"contador_secuencia: "+string(obj_boss_spider.contador_secuencia)); _i += _height;
	//draw_text(700,_i,"boss.state: "+string(obj_boss_spider.state)); _i += _height;
	//draw_text(700,_i,"boss.estado_iniciado: "+string(obj_boss_spider.estado_iniciado)); _i += _height;
	//draw_text(700,_i,"boss.vidas: "+string(obj_boss_spider.vidas)); _i += _height;
	
	//draw_text(700,_i,"boss.image_xscale: "+string(obj_boss_spider.image_xscale)); _i += _height;
	//draw_text(700,_i,"x_inicial: "+string(BossState_Movimiento.x_inicial)); _i += _height;
	//draw_text(700,_i,"x_final: "+string(BossState_Movimiento.x_final)); _i += _height;
	
	//draw_text(700,_i,"camera_get_view_x: "+string(camera_get_view_x(view_camera[1]))); _i += _height;

}
