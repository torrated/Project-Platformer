/// @description Coge la espada y cambia los sprites

if (place_meeting(x,y,obj_player))
{
	obj_player.var_obj_arma = obj_espada;
	obj_player.var_sprite_quieto = asset_get_index(string_concat(sprite_get_name(obj_player.var_sprite_quieto),"_espada"));
	obj_player.var_sprite_corriendo = asset_get_index(string_concat(sprite_get_name(obj_player.var_sprite_corriendo),"_espada"));
	obj_player.var_sprite_ataque = asset_get_index(string_replace(sprite_get_name(obj_player.var_sprite_quieto),"quieto","ataque"));
	obj_player.var_sprite_ataqueHB = asset_get_index(string_concat(sprite_get_name(obj_player.var_sprite_ataque),"HB")); //hitbox
	obj_player.var_sprite_saltando_ataque = asset_get_index(string_concat(sprite_get_name(obj_player.var_sprite_saltando),"_ataque"));

	instance_destroy(obj_espada_clavada); 
}
