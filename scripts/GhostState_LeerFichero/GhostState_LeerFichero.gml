function GhostState_LeerFichero()
{
	//array para reproducir el ghost
	array_lectura_x = array_create(0);
	array_lectura_y = array_create(0);
	array_lectura_sprite = array_create(0);
	array_lectura_image = array_create(0);
	array_lectura_xscale = array_create(0);
	
	//array para grabar el ghost al fichero
	array_escritura_x = array_create(0);
	array_escritura_y = array_create(0);
	array_escritura_sprite = array_create(0);
	array_escritura_image = array_create(0);
	array_escritura_xscale = array_create(0);

	//abrimos el fichero
	ini_open(obj_ghost.fichero_ghost);
	obj_ghost.length = ini_read_real("length",0,-1);
	if (obj_ghost.length > -1) //si el fichero existe
	{
		obj_ghost.reproducir = true;
		//leemos la informacion en el array de lectura
		var _i = 0;
		repeat (obj_ghost.length)
		{
			array_lectura_x[_i] = ini_read_real("x",_i,-1);
			array_lectura_y[_i] = ini_read_real("y",_i,-1);
			array_lectura_sprite[_i] = ini_read_real("sprite",_i,-1);
			array_lectura_image[_i] = ini_read_real("image",_i,-1);
			array_lectura_xscale[_i] = ini_read_real("xscale",_i,-1);
			_i++;
		}
	}
	
	obj_ghost.state = GHOSTSTATE.GRABAR;
}