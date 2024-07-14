/// @description Debug

draw_self()

if (obj_debug.var_debug_mode)
{
	draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,true); // hitbox
	draw_rectangle_color(x-sprite_width/2,y,x+sprite_width/2,y-sprite_height,c_white,c_white,c_white,c_white,true); // sprite
/*	
	draw_line(bbox_left,bbox_top,bbox_left,bbox_top-50) //raycasting izquierda
	draw_line((bbox_right+bbox_left)/2,bbox_top,(bbox_right+bbox_left)/2,bbox_top-50) //raycasting medio
	draw_line(bbox_right,bbox_top,bbox_right,bbox_top-50) //raycasting derecha */
}