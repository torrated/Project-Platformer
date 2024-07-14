/// @description Destruye el cronometro y para la musica

//crono
time_source_destroy(time_per_second);



//musica
if (musica)
{
	audio_stop_sound(musica);
}