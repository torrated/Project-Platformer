/// @description 

if (var_collected)
{
	var_remains -= 1;
	if (var_remains <= 0) instance_destroy();
	else y -= 1;
}