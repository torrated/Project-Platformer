/// @description

if (audio_is_playing(global.musica))
{
	audio_stop_sound(global.musica);
	fnc_reinicia_musica();
}