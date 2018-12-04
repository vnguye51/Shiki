/// @description Insert description here
if instance_exists(PlayerObj){
	x0 = camera_get_view_x(view_camera[0])
	x1 = x0 + camera_get_view_width(view_camera[0])
	y0 = camera_get_view_y(view_camera[0])
	y1 = y0 + camera_get_view_height(view_camera[0])
	ypos = random_range(y0,y1) - 40

	if irandom(1) == 0 {
		xpos = x0 - 40
		var bat = instance_create_depth(xpos,ypos,0,BatObj)
	}
	else{
		xpos = x1 + 40
		var bat = instance_create_depth(xpos,ypos,0,BatObj)
		bat.image_xscale = -1
	}
}
alarm[0] = 300