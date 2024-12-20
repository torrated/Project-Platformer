/// @description Dibuja las sombras

if (instance_exists(obj_player_parent))
	fnc_sombra(instance_find(obj_player_parent,0)); 
	
if (instance_exists(obj_dummy))
	fnc_sombra(instance_find(obj_dummy,0));
	
if (instance_exists(obj_spider_mueve))
	for (var _i = 0; _i < instance_number(obj_spider_mueve); ++_i;)
	{
	    fnc_sombra(instance_find(obj_spider_mueve,_i));
	}

if (instance_exists(obj_spider_quieta))
	for (var _i = 0; _i < instance_number(obj_spider_quieta); ++_i;)
	{
	    fnc_sombra(instance_find(obj_spider_quieta,_i));
	}

if (instance_exists(obj_moneda) && instance_exists(obj_player_parent))
	for (var _i = 0; _i < instance_number(obj_moneda); ++_i;)
	{
		// sólo se dibuja la sombra si el objeto está cerca de la pantalla
	    var _instancia = instance_find(obj_moneda,_i);
		var _rango_x_izquierdo = obj_player_parent.x-display_get_gui_width();
		var _rango_x_derecho = obj_player_parent.x+display_get_gui_width();
		
		if (_instancia.x-_instancia.sprite_width < _rango_x_derecho && 
			_instancia.x+_instancia.sprite_width > _rango_x_izquierdo)
			fnc_sombra(_instancia, 5);
	}

if (instance_exists(obj_boss_spider))
	fnc_sombra(instance_find(obj_boss_spider,0),2);