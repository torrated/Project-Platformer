function PlayerState_Quieto()
{
	if (instance_exists(obj_player_parent))
	{
		obj_player_parent.var_velocidad_horizontal = 0;
		obj_player_parent.var_puede_leer_input = false;
		obj_player_parent.image_speed = 0;
	
		obj_player_parent.state = PLAYERSTATE.LIBRE;
	}
}