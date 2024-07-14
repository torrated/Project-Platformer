function GhostState_Grabar()
{
	if (instance_exists(obj_player_parent)) && (obj_ghost.grabar)
	{
		array_escritura_x[obj_ghost.index] = obj_player_parent.x;
		array_escritura_y[obj_ghost.index] = obj_player_parent.y;
		array_escritura_sprite[obj_ghost.index] = obj_player_parent.sprite_index;
		array_escritura_image[obj_ghost.index] = obj_player_parent.image_index;
		array_escritura_xscale[obj_ghost.index] = obj_player_parent.image_xscale;
	}
}
