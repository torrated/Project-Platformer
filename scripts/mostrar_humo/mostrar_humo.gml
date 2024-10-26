function mostrar_humo(x_in, y_in, depth_in){
	var _separacion = 12; //distancia a los lados a los que se mostrará el humo
	
	humo_izq = instance_create_depth(x_in-_separacion,y_in,depth_in,obj_polvo);
	humo_der = instance_create_depth(x_in+_separacion,y_in,depth_in,obj_polvo);

}