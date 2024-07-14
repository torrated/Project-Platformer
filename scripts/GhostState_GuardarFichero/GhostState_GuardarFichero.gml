function GhostState_GuardarFichero()
{
	if (obj_ghost.grabar) // para test grabo 30 segundos: 30x60 frames
	{
		obj_ghost.grabar = false;
		ini_write_real("length",0,obj_ghost.index);
		
		var _i = 0;
		repeat(obj_ghost.index)
		{
			ini_write_real("x",_i,array_escritura_x[_i]);
			ini_write_real("y",_i,array_escritura_y[_i]);
			ini_write_real("sprite",_i,array_escritura_sprite[_i]);
			ini_write_real("image",_i,array_escritura_image[_i]);
			ini_write_real("xscale",_i,array_escritura_xscale[_i]);
			_i++;
		}
		
		ini_close();
		obj_ghost.state = GHOSTSTATE.DETENER;
	}
}