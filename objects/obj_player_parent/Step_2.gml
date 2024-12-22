/// @description Control del parpadeo

if (var_golpeado)
{
	if ((image_alpha == 1) && (var_salud > 0)) //image visible
	{
		image_alpha = 0; //image no visible
	}
	else
	{
		image_alpha = 1;
	}
}