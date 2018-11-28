//scr_text("Text",speed,x,y)
txt = instance_create_depth(0,0,0,DialogObj)
with txt{
	text = argument0
	spd = argument1
	left_char = instance_create_depth(0,0,0,DialogPortraitObj)
	left_char.char_sprite = argument2
	left_char.char_sprite_x = 20
	left_char.char_sprite_y = 20
	left_char.col = make_color_rgb(255,255,255)

	left_char.image_xscale = 1
	right_char = instance_create_depth(0,0,0,DialogPortraitObj)
	right_char.char_sprite = argument3
	right_char.char_sprite_x = 380
	right_char.char_sprite_y = 20
	right_char.image_xscale = -1
	right_char.col = make_color_rgb(50,50,50)
	if text[0] == "/" {
		textindex += 1
		temp = right_char.col
		right_char.col = left_char.col
		left_char.col = temp
	}
}