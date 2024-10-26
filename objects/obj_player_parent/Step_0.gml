///@description Lee el input y selecciona el estado en la state machine

// inicializamos un par de variables

var_puede_saltar -= 1;
keybuffer_salto -= 1;

if (instance_exists(obj_juego))
{
	var_en_el_suelo = place_meeting(x,y+1,[layer_tilemap_get_id(obj_juego.tileset),obj_muro_invisible]);
}


// leer input del jugador
if (var_puede_leer_input)
{
	var_key_left = global.izquierda;
	var_key_right = global.derecha;
	var_key_jump = global.salto;
	var_key_attack = global.ataque;
	var_movimiento = global.movimiento;
}


if (var_en_el_suelo)
{
	var_puede_saltar = 10;
	
	if (keybuffer_salto > 0)
	{
		var_key_jump = 1;
		keybuffer_salto = keybuffer_salto_init;
	}
}


if !(var_en_el_suelo) && (var_key_jump)
{
	keybuffer_salto = keybuffer_salto_init;
}


// seleccionamos el estado
switch (state)
{
	case PLAYERSTATE.LIBRE: PlayerState_Libre(); break;
	case PLAYERSTATE.ATAQUE_SLASH: PlayerState_Ataque_Slash(); break;
	case PLAYERSTATE.ATAQUE_COMBO: PlayerState_Ataque_Combo(); break;
	case PLAYERSTATE.MUERTO: PlayerState_Muerto(); break;
	case PLAYERSTATE.GOLPEADO: PlayerState_Golpeado(); break;
	case PLAYERSTATE.QUIETO: PlayerState_Quieto(); break;
}