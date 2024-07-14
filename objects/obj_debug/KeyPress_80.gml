/// @description (des)habilita 5 FPS

if !(game_get_speed(gamespeed_fps)==5)
{
	game_set_speed(5, gamespeed_fps);
}
else
{
	game_set_speed(60, gamespeed_fps);
}