/// @description Inicia la música y crea el crono

//crono

var _my_method = function()
{
	if (instance_exists(obj_juego)) obj_juego.timer += 0.1;
}

obj_juego.timer = 0;

time_per_second = time_source_create(time_source_game, 0.1, time_source_units_seconds, _my_method, [], -1, time_source_expire_after);



//musica
if !(audio_is_playing(musica))
{
	musica = audio_play_sound(snd_musica1,1,true);
}