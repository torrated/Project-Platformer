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

if (instance_exists(obj_moneda) && 1==2)
//show_message()
	for (var _i = 0; _i < instance_number(obj_moneda); ++_i;)
	{
	    fnc_sombra(instance_find(obj_moneda,_i));
	}