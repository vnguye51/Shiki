if pause{	
	draw_sprite(MenuBackgroundSprite,0,0,0)
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

	if menu_options[index] == "Items" {
		draw_sprite(MenuDividerSprite,0,286,75)
		draw_sprite(ItemPlatformSprite,0,317,88)
		for (i=0;i<ceil(ds_list_size(global.obtained_item_list)/2); i += 1){
			for (j=0 ; j<2 and i*2+j < ds_list_size(global.obtained_item_list); j += 1){
				if subindex == i*2+j {
					//Grab item info and draw
					item = global.obtained_item_list[| subindex]
					item_count = global.obtained_items[? item]
					item_info = global.item_map[? item]
					item_sprite = asset_get_index(string_letters(item_info[? "name"] + "Sprite"))
					draw_text_color(120+80*j,90+20*i,global.obtained_item_list[| i*2+j] + "(" + string(item_count) + ")",c_lime,c_lime,c_green,c_green,1)
					draw_text_ext(300,160,item_info[? "description"], 12, 84)
					draw_sprite_stretched(item_sprite,0,318,90,48,48)

				}
				else {
					iter_item = global.obtained_item_list[| i*2+j]
					iter_item_count = global.obtained_items[? iter_item]
					draw_text(120+80*j,90+20*i,iter_item + "(" + string(iter_item_count) + ")")
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
