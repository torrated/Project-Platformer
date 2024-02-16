/// @description Parallax

background_map = ds_map_create();
background_map[? layer_get_id("Cielo")] = 1;
background_map[? layer_get_id("Montanas")] = 0.95;
background_map[? layer_get_id("Arboles_Lejanos")] = 0.75;
background_map[? layer_get_id("Arboles_Cercanos")] = 0.50;
background_map[? layer_get_id("Arbustos")] = 0.0;
//background_map[? layer_get_id("B_Ground_Path")] = 0;
//background_map[? layer_get_id("B_Foreground")] = -0.5;