/// @description Coge la espada y cambia los sprites

if (place_meeting(x,y,obj_geronimo))
{
	obj_geronimo.var_sprite_quieto = spr_geronimo_quieto_espada;
	obj_geronimo.var_sprite_corriendo = spr_geronimo_corriendo_espada;
	obj_geronimo.var_sprite_ataque = spr_geronimo_ataca_espada;
	obj_geronimo.var_arma = "espada";
	
	instance_destroy(obj_espada_clavada); 
}

