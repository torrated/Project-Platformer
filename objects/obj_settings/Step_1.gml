/// @description lee input

//teclas o botones
if (gamepad_is_connected(0)) && (global.gamepad)
{	
	global.arriba = gamepad_button_check_pressed(0,gp_padu);
	global.abajo = gamepad_button_check_pressed(0,gp_padd);
	global.izquierda = noone;
	global.derecha= noone;
	
	global.enter = gamepad_button_check_pressed(0,gp_face1);
	global.salto = global.enter;
	global.pausa = gamepad_button_check_pressed(0,gp_select);

	global.movimiento = gamepad_axis_value(0, gp_axislh);
	global.ataque = gamepad_button_check_pressed(0, gp_face3);
}
else 
{	
	global.arriba = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	global.abajo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	global.izquierda = keyboard_check(vk_left) || keyboard_check(ord("A"));
	global.izquierda_pressed = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")); //para pulsaciones no continuas, como el volumen
	global.derecha = keyboard_check(vk_right) || keyboard_check(ord("D"));
	global.derecha_pressed = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")); //para pulsaciones no continuas, como el volumen
	
	global.enter = keyboard_check_pressed(vk_enter);
	global.salto = keyboard_check_pressed(vk_space);
	global.pausa = keyboard_check_pressed(vk_escape);

	global.movimiento = global.derecha - global.izquierda;
	global.ataque = noone;
}