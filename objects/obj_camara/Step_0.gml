/// @description Control de la cámara

//Cancela el scroll inicial
if (global.salto)
{
	if (instance_exists(obj_juego)) && (obj_juego.scroll_inicial) 
	{
		obj_juego.scroll_inicial = false;
	}
}


// actualizamos destino
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}



// si el personaje está en movimiento (horizontal o vertical), la cámara se aleja
if ((instance_exists(obj_player_parent)) && (abs(obj_player_parent.var_velocidad_horizontal) > 0)) || (alejar)
{
	sizeSpeed = min(sizeSpeed + sizeSpeedIncrease,sizeSpeedMax);
}
else
{
	sizeSpeed = max(sizeSpeed - sizeSpeedIncrease,0);
}	

camera_set_view_size(camara1,256*(1+sizeMultiplier*(sizeSpeed/sizeSpeedMax)),192*(1+sizeMultiplier*(sizeSpeed/sizeSpeedMax)));
view_w_half = camera_get_view_width(camara1)/2;
view_h_half = camera_get_view_height(camara1)/2;



//actualizamos posicion
x += (xTo - x) / 15;
y += (yTo - y) / 15;

x = clamp(x,view_w_third,room_width-view_w_third);
y = clamp(y,view_h_half,room_height-view_h_half);



// actualizamos la camara siguiendo al jugador
if (instance_exists(obj_juego)) && !(obj_juego.scroll_inicial)
{
	camera_set_view_pos(camara1,x-view_w_third,y-view_h_half);

	var _state = time_source_get_state(obj_juego.time_per_second);

    if !(_state == time_source_state_active)
	{
		obj_juego.alarm[0] = 1;
		obj_player_parent.var_puede_leer_input = !global.secuencia_iniciada;
	}
}
else //scroll inicial
{
	camera_set_view_pos(camara1,pos,y-view_h_half);
	pos = pos - 10;
	if (pos < 0)
	{
		pos = 0;
		if (instance_exists(obj_juego)) && (instance_exists(obj_player_parent))
		obj_juego.scroll_inicial = false;
		obj_juego.alarm[0] = 1;
		obj_player_parent.var_puede_leer_input = true;
	}
}



// parallax, pero sólo si usamos el viewport 0
if (view_get_visible(0))
{
	if (layer_exists("Montanas")) layer_x("Montanas",x * 0.95);
	if (layer_exists("Arboles_Lejanos")) layer_x("Arboles_Lejanos",x * 0.75);
	if (layer_exists("Arboles_Cercanos")) layer_x("Arboles_Cercanos",x * 0.50);
	if (layer_exists("Arbustos")) layer_x("Arbustos",x * 0.25);
}