// Enemigo

// al ser golpeados por un enemigo, saltamos hacia atras y perdemos uno de salud
if !(var_golpeado) // no podemos ser golpeados si estamos en estado golpeado
{
	var_velocidad_vertical = var_velocidad_salto/1.5; // velocidad salto es negativa, asi que sumamos
	var_velocidad_horizontal = var_velocidad_golpeado * sign(image_xscale);
	var_golpeado =  true;
	var_salud -= 1;
}

if (var_salud <= 0) // si se acaba la vida no leemos input. La animacion de muerte es la que hará reiniciar la fase
{
	var_puede_leer_input = false;
}