/// Add letters over time
if textindex >= array_length_1d(text){
	instance_destroy()
	instance_destroy(DialogPortraitObj)
	PlayerObj.control = true
}
else{
	
	if (time < string_length(text[textindex])) {
		time += spd;
		print = string_copy(text[textindex],0,time)
	}
	

	draw_sprite(TextBoxSprite,0,10,185)
	draw_set_font(font0)
	draw_text_ext(20,195,print,18,360)

	draw_set_alpha(1)
}

