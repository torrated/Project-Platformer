// inicializamos las teclas pulsadas
var _var_key_left = false;
var _var_key_right = false;
var _var_key_jump = false;
var _var_key_attack = false;



// leer input del jugador
if ((var_puede_leer_input) && !(var_golpeado) && (var_salud > 0))
{ if is_debug_overlay_open() show_debug_message("11");
	 _var_key_left = keyboard_check(vk_left);
	 _var_key_right = keyboard_check(vk_right);
	 _var_key_jump = keyboard_check_pressed(vk_space);

	 _var_key_attack = keyboard_check_pressed(ord("A"));
}

var _var_en_el_suelo = place_meeting(x,y+1,obj_muro_parent);



// calcular movimiento
if ((!var_golpeado) && (var_puede_leer_input))
{ if is_debug_overlay_open()  show_debug_message("25");
	var _var_move = _var_key_right - _var_key_left; // si mueve a la derecha entonces esto vale 1. Si izquierda, -1. Si nada o ambos, 0
	var_velocidad_horizontal = _var_move * var_velocidad_caminar;
}
else // si el jugador es golpeado, cae sin leer input hasta tocar el suelo
{ if is_debug_overlay_open()  show_debug_message("30");
	// si la velocidad vertical es 0 y estamos en el suelo y aun tiene vida, ya se puede leer el input porque hemos terminado de caer
	if ((var_velocidad_vertical = 0) && (_var_en_el_suelo) && (var_salud > 0))
	{ if is_debug_overlay_open()  show_debug_message("33");
		var_puede_leer_input = true;
		var_golpeado = false;
		image_alpha = 1; // ya no es semi transparente
	}
}

var_velocidad_vertical += var_gravedad;

if (_var_en_el_suelo && (_var_key_jump)) // si esta en el suelo y se presiona saltar
{ if is_debug_overlay_open()  show_debug_message("43");
	var_velocidad_vertical = var_velocidad_salto
}



// colision horizontal
if (place_meeting(x+var_velocidad_horizontal,y,obj_muro_parent)) // si hay una colision a donde DEBERIA moverse..
{ if is_debug_overlay_open()  show_debug_message("51");
	while (!place_meeting(x+sign(var_velocidad_horizontal),y,obj_muro_parent))
	{  if is_debug_overlay_open() show_debug_message("53");
		x += sign(var_velocidad_horizontal); // ...nos acercamos pixel por pixel
	}
	var_velocidad_horizontal = 0; // y nos paramos
}
x += var_velocidad_horizontal;



// colision vertical
if (place_meeting(x,y+var_velocidad_vertical,obj_muro_parent))
{  if is_debug_overlay_open() show_debug_message("64");
	while (!place_meeting(x,y+sign(var_velocidad_vertical),obj_muro_parent))
	{ if is_debug_overlay_open()  show_debug_message("66");
		y += sign(var_velocidad_vertical);
	}
	var_velocidad_vertical = 0;
}
y += var_velocidad_vertical;



// parpadeo del personaje al ser golpeado
if (var_golpeado) //|| (var_salud <= 0)
{ if is_debug_overlay_open()  show_debug_message("77");
	if (image_alpha == 1) //image visible
	{ if is_debug_overlay_open()  show_debug_message("81");
		image_alpha = 0; //image no visible
	}
	else
	{  if is_debug_overlay_open() show_debug_message("85");
		image_alpha = 1;
	}
}



// animacion
if (!_var_en_el_suelo) // si NO en el suelo, cambiamos el sprite a saltando
{  if is_debug_overlay_open() show_debug_message("92");
	sprite_index = var_sprite_saltando;
}
else
{  if is_debug_overlay_open() show_debug_message("99");
	if (var_salud > 0)
	{  if is_debug_overlay_open() show_debug_message("101");
		if ((image_speed > 0) && (sprite_index == var_sprite_ataque)) // estaba atacando y aun hay que terminar la animacion
		{ if is_debug_overlay_open()  show_debug_message("103");
			if (image_index >= image_number - 1) // fin de animacion
			{  if is_debug_overlay_open() show_debug_message("105");
				sprite_index = var_sprite_quieto;
				image_speed = 0;
				var_puede_leer_input = true; // ya puede leerse el teclado otra vez
			}	
		}
		else
		{
			if ((_var_key_attack) && (var_obj_arma != noone)) // ataca y lleva un arma
			{  if is_debug_overlay_open() show_debug_message("114");
				sprite_index = var_sprite_ataque; //cambiamos al sprite de ataque correspondiente
				image_speed = 1; //animación del ataque activada
				var_velocidad_horizontal = sign(image_xscale)*var_velocidad_caminar;// se mueve hacia adelante al atacar		
				var_puede_leer_input = false; // no puede leerse el teclado hasta que acabe la animacion del ataque
			}
			else 
			{
				if (var_velocidad_horizontal == 0)
				{ if is_debug_overlay_open()  show_debug_message("122");
					sprite_index = var_sprite_quieto;
				}
				else
				{  if is_debug_overlay_open() show_debug_message("126");
					image_speed = 1 // animacion habilitada para correr
					sprite_index = var_sprite_corriendo;
				}
			}
		}
	}//salud > 0
	else //salud <= 0
	{  if is_debug_overlay_open() show_debug_message("131");
		if (yprevious <= y) // esto significa que esta en el suelo y en frame anterior ya no caia
		{ if is_debug_overlay_open() show_debug_message("133");
			var_velocidad_horizontal = 0;
			sprite_index = var_sprite_muere;
			image_alpha = 1; // fin del parpadeo
			var_golpeado = false; // para que no parpadee mas
			if (image_speed == 0) //no esta animado
			{ if is_debug_overlay_open() show_debug_message("139");
				image_speed = 1; // iniciamos la animacion
			}
			else // ya esta animado. Hay que buscar si ha terminado la animacion
			{ if is_debug_overlay_open() show_debug_message("143");
				if (image_index > image_number - 1) // estamos en el ultimo frame de la animacion
				{ if is_debug_overlay_open() show_debug_message("145");
					image_speed = 0; // detenemos la animacion
					game_restart();
				}
			}
		}
		else 
		{ if is_debug_overlay_open() show_debug_message("138");
			 if is_debug_overlay_open() show_debug_message(string_concat("previous: ",yprevious,"   actual: ",y));
		}
	} 
}

if (var_velocidad_horizontal != 0) // si se estaba moviendo, dejamos el sprite en la direccion en la que estaba
{  if is_debug_overlay_open() show_debug_message("142");
	image_xscale = sign(var_velocidad_horizontal); // ajusta el sprite para mirar derecha o izquierda
}