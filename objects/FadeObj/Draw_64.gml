a = clamp(a+(fade*0.01),0,1)
if (a == 1){
	room_goto(GameOver)
	fade = -1
}

if (a == 0) and (fade == -1){
	instance_destroy()
}

draw_set_color(c_black)
draw_set_alpha(a)
draw_rectangle(0,0,480,240,0)
draw_set_alpha(1)