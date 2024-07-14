/// @description Comprueba si el jugador tiene 100 monedas

if (var_monedas >= 100)
{
	with (obj_player_parent)
	{
		if (var_salud == var_max_salud)
		{
			obj_vidas.vidas += 1;
			other.sube_vida = true;
			audio_play_sound(snd_vidaextra,1,false);
		}
		else
		{
			var_salud += 1;
			other.sube_corazon = true;
			audio_play_sound(snd_corazon,1,false);
		}
	}
	var_monedas -= 100;
}