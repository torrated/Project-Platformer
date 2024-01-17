// leer input del jugador
if (var_puede_leer_input)
{
	 _var_key_left = keyboard_check(vk_left);
	 _var_key_right = keyboard_check(vk_right);
	 _var_key_jump = keyboard_check_pressed(vk_space);

	 _var_key_attack = keyboard_check_pressed(ord("A"));
}


// calcular movimiento
var _var_move = _var_key_right - _var_key_left; // si mueve a la derecha entonces esto vale 1. Si izquierda, -1. Si nada o ambos, 0
var_velocidad_horizontal = _var_move * var_velocidad_caminar;

var_velocidad_vertical += var_gravedad;

var _var_en_el_suelo = place_meeting(x,y+1,obj_muro_parent);

if (_var_en_el_suelo && (_var_key_jump)) // si esta en el suelo y se presiona saltar
{
	var_velocidad_vertical = var_velocidad_salto
}



// colision horizontal
if (place_meeting(x+var_velocidad_horizontal,y,obj_muro_parent)) // si hay una colision a donde DEBERIA moverse..
{
	while (!place_meeting(x+sign(var_velocidad_horizontal),y,obj_muro_parent))
	{
		x += sign(var_velocidad_horizontal); // ...nos acercamos pixel por pixel
	}
	var_velocidad_horizontal = 0; // y nos paramos
}
x += var_velocidad_horizontal;



// colision vertical
if (place_meeting(x,y+var_velocidad_vertical,obj_muro_parent))
{
	while (!place_meeting(x,y+sign(var_velocidad_vertical),obj_muro_parent))
	{
		y += sign(var_velocidad_vertical);
	}
	var_velocidad_vertical = 0;
}
y += var_velocidad_vertical;



// animacion
if (!_var_en_el_suelo) // si NO en el suelo, cambiamos el sprite a saltando
{
	sprite_index = var_sprite_saltando;
}
else
{
	if (image_speed > 0) && (sprite_index == var_sprite_ataque) // estaba atacando y hay que terminar la animacion
	{
		if (image_index >= image_number - 1)
		{
			sprite_index = var_sprite_quieto;
			image_speed = 0;
			var_puede_leer_input = true; // ya puede leerse el teclado otra vez
		}	
	}
	else
	{
		if (_var_key_attack) && (var_arma != noone)
		{
			sprite_index = var_sprite_ataque;
			image_speed = 1; //animación del ataque
			var_puede_leer_input = false; // no puede leerse el teclado hasta que acabe la animacion del ataque
		}
		else 
		{
			if (var_velocidad_horizontal == 0)
			{
				sprite_index = var_sprite_quieto;
			}
			else
			{
				image_speed = 1 // animacion habilitada para correr
				sprite_index = var_sprite_corriendo;
			}
		}
	}
}

if (var_velocidad_horizontal != 0) // si no se esta moviendo, dejamos el sprite en la direccion on la que estaba
{
	image_xscale = sign(var_velocidad_horizontal); // ajusta el sprite para mirar derecha o izquierda
}






