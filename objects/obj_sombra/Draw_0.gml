/// @description Dibuja la sombra del player

var _objeto = noone;

if (instance_exists(obj_player_parent))
	_objeto = obj_player_parent;
else if (instance_exists(obj_dummy))
	_objeto = obj_dummy;
	
if (_objeto <> noone)
{
	var _y = 0;
	if (sign(_objeto.image_xscale) == 1)
	{
		var _x1 = _objeto.x-_objeto.sprite_width/3;
		var _x2 = _objeto.x;
		var _x3 = _objeto.x+_objeto.sprite_width/3;
	}
	else
	{
		var _x1 = _objeto.x+_objeto.sprite_width/3;
		var _x2 = _objeto.x;
		var _x3 = _objeto.x-_objeto.sprite_width/3;
	}
	
	var _alpha = draw_get_alpha();
	draw_set_alpha(0.35);
	
	for (var _i = _x1; _i <= _x3; _i++)
	{
		_y = _objeto.y;
		if (_objeto == obj_dummy)
			_y = 137;
		else
		{
			while !(collision_point(_i,_y,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible],false,false))
				_y += 1
		}
		draw_line_width_color(_i,_y,_i+1,_y,0.5,c_black,c_black);
	}

	draw_set_alpha(_alpha);
}