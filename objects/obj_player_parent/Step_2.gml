/// @description Control del parpadeo

if (var_golpeado)
{
	if ((image_alpha == 1) && (var_salud > 0)) //image visible
	{																						if is_debug_overlay_open() show_debug_message("Alpha es 1 y pongo 0");
		image_alpha = 0; //image no visible
	}
	else
	{																						if is_debug_overlay_open() show_debug_message("Alpha es 0 y pongo 1");
		image_alpha = 1;
	}
}