/// @description Debug y Activar el shader al ser golpeado
draw_self();

if (var_flash > 0)
{
	shader_set(Rojo);
	draw_self();
	shader_reset();
	var_flash -= 1;
}

if (obj_debug.var_debug_mode)
{
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true); // hitbox
	draw_rectangle_color(x-sprite_width/2,y,x+sprite_width/2,y-sprite_height,c_white,c_white,c_white,c_white,true); // sprite

	draw_point_color(bbox_left,y+1,c_blue); //en un borde
	draw_point_color(bbox_right,y+1,c_blue); //en un borde
	draw_point_color(x+(image_xscale * velocidad),y,c_red); //en una pared

	var _en_un_borde = 0;
	if (image_xscale == 1)
	_en_un_borde = !place_meeting(bbox_right,y+1,layer_tilemap_get_id(obj_juego.tileset)); 
	else
	_en_un_borde = !place_meeting(bbox_left,y+1,layer_tilemap_get_id(obj_juego.tileset)); 
	
	draw_text_transformed(x,y-sprite_height,"en un borde:"+string(_en_un_borde),0.25,0.25,image_angle);
	draw_text_transformed(x,y-sprite_height-10,"en una pared:"+string(place_meeting(x+(image_xscale * velocidad),y,layer_tilemap_get_id(obj_juego.tileset))),0.25,0.25,image_angle);
}