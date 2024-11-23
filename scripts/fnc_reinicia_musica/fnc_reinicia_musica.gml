function fnc_reinicia_musica(){
	global.musica = audio_play_sound(Castle_Kingdom_Adventure_2,1,true,1);
	audio_pause_sound(global.musica);
}