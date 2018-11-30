if pause{	
	draw_set_font(font0)
	for (i=0;i<array_length_1d(menu_options); i+= 1){
		if i == index{
		draw_text_color(15,90+20*i,menu_options[i],c_lime,c_lime,c_green,c_green,1)
		}
		else{
		draw_text(15,90+20*i,menu_options[i])
		}
	}
	draw_text(100,24,"HP: " + string(hp) + "/" + string(maxhp))
	draw_text(100,44,"MP: " + string(mp) + "/" + string(maxmp))
	draw_text(200,24,"LV: " + string(1))
	draw_text(200,44,"To Next: 3234214")
	draw_sprite(MenuPortraitSprite,0,9,8)
}
