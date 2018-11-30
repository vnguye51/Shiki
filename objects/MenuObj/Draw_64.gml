if pause{	
	draw_set_font(font0)
	var i = 0
	for (i=0;i<array_length_1d(menu_options); i+= 1){
		if i == index{
			draw_text_color(15,90+20*i,menu_options[i],c_lime,c_lime,c_green,c_green,1)
		}
		else{
			draw_text(15,90+20*i,menu_options[i])
		}
	}
	i = 0
	var j = 0
	if menu_options[index] == "Items" {
		for (i=0;i<ceil(array_length_1d(items)/2); i += 1){
			for (j=0 ; j<2 and i*2+j < array_length_1d(items); j += 1){
				if subindex == i*2+j {
					draw_text_color(120+80*j,90+20*i,items[i*2+j],c_lime,c_lime,c_green,c_green,1)
				}
				else {
					draw_text(120+80*j,90+20*i,items[i*2+j])
				}
			}
		}
	}	
	draw_text(100,24,"HP: " + string(hp) + "/" + string(maxhp))
	draw_text(100,44,"MP: " + string(mp) + "/" + string(maxmp))
	draw_text(200,24,"LV: " + string(1))
	draw_text(200,44,"To Next: 3234214")
	draw_sprite(MenuPortraitSprite,0,9,8)
}
