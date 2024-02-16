///@description Lee el input y selecciona el estado en la state machine

// inicializamos las teclas pulsadas
var_key_left = false;
var_key_right = false;
var_key_jump = false;
var_key_attack = false;
var_key_run = false;
var_en_el_suelo = place_meeting(x,y+1,layer_tilemap_get_id("Tileset2"));



// leer input del jugador
if ((var_puede_leer_input))//&& !(var_golpeado) && (var_salud > 0))
{													if is_debug_overlay_open() show_debug_message("Step y leemos el input");
	 var_key_left = keyboard_check(vk_left);
	 var_key_right = keyboard_check(vk_right);
	 var_key_jump = keyboard_check_pressed(vk_space);
	 var_key_attack = keyboard_check_pressed(ord("A"));
	 var_key_run = keyboard_check(vk_shift);
}

switch (state)
{
	case PLAYERSTATE.LIBRE: PlayerState_Libre(); break;
	case PLAYERSTATE.ATAQUE_SLASH: PlayerState_Ataque_Slash(); break;
	case PLAYERSTATE.ATAQUE_COMBO: PlayerState_Ataque_Combo(); break;
	case PLAYERSTATE.MUERTO: PlayerState_Muerto(); break;
	case PLAYERSTATE.GOLPEADO: PlayerState_Golpeado(); break;
}