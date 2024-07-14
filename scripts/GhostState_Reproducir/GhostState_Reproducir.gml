function GhostState_Reproducir()
{
	if (obj_ghost.reproducir)
	{
		_index = min(obj_ghost.index,obj_ghost.length-1);
		obj_ghost.x = array_lectura_x[_index];
		obj_ghost.y = array_lectura_y[_index];
		obj_ghost.sprite_index = array_lectura_sprite[_index];
		obj_ghost.image_index = array_lectura_image[_index];
		obj_ghost.image_xscale = array_lectura_xscale[_index];
		obj_ghost.image_alpha = 0.5;
	}
}