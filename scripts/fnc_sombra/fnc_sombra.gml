function fnc_sombra(_objeto = instance_find(obj_sombra,0))
// dibuja la sombra de la instancia pasada como argumento
{
	var _y = 0;
	var _x1 = 0;
	var _x2 = 0;
	var _x3 = 0;
	
	if (sign(_objeto.image_xscale) == 1)
	{
		_x1 = _objeto.x-_objeto.sprite_width/3;
		_x2 = _objeto.x;
		_x3 = _objeto.x+_objeto.sprite_width/3;
	}
	else
	{
		_x1 = _objeto.x+_objeto.sprite_width/3;
		_x2 = _objeto.x;
		_x3 = _objeto.x-_objeto.sprite_width/3;
	}
	
	var _alpha = draw_get_alpha();
	draw_set_alpha(0.35);
	
	for (var _i = _x1; _i <= _x3; _i++)
	{
		_y = _objeto.y;
		if (_objeto.object_index == obj_dummy)
			_y = 137;
		else
		{
			while (!(collision_point(_i,_y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,false)) && (_y <= room_height))
				_y += 1
		}
		draw_line_width_color(_i,_y,_i+1,_y,0.5,c_black,c_black);
	}

	draw_set_alpha(_alpha);
}