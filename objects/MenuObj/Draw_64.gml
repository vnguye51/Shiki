draw_set_color(c_white)

if pause{	
	draw_sprite(MenuBackgroundSprite,0,0,0)
	draw_sprite(MenuDividerSprite,0,60,75)
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
				if subindex == i*2+j{
					//Grab item info and draw
					item = global.obtained_item_list[| subindex]
					item_count = global.obtained_items[? item]
					item_info = global.item_map[? item]
					item_sprite = asset_get_index(string_letters(item_info[? "name"] + "Sprite"))
					draw_text_ext(300,160,item_info[? "description"], 12, 84)
					draw_sprite_stretched(item_sprite,0,318,90,48,48)
					if submenu{
						draw_text_color(75+110*j,90+20*i,global.obtained_item_list[| i*2+j] + "(" + string(item_count) + ")",c_lime,c_lime,c_green,c_green,1)
					}
					else{
						draw_text(75+110*j,90+20*i,global.obtained_item_list[| i*2+j] + "(" + string(item_count) + ")")
					}
				}
				else {
					iter_item = global.obtained_item_list[| i*2+j]
					iter_item_count = global.obtained_items[? iter_item]
					draw_text(75+110*j,90+20*i,iter_item + "(" + string(iter_item_count) + ")")
				}
			}
		}
	}	
	
	else if menu_options[index] == "Equip" {
		///Draw Dividers///
		draw_sprite(MenuDividerSprite,0,170,75)
		draw_sprite(MenuDividerSprite,0,286,75)
		draw_sprite(ItemPlatformSprite,0,317,88)
		////
		
		///Draw equipment options
		
		if subindex == 0 and submenu == true{
			draw_text_color(75,90,global.equipped_soul,c_lime,c_lime,c_green,c_green,1)
		}
		else{
			draw_text(75,90,global.equipped_soul)
		}
		
		if subindex == 1{
			draw_text_color(75,110,global.equipped_armors,c_lime,c_lime,c_green,c_green,1)
		}
		else{
			draw_text(75,110,global.equipped_armors)
		}
		
		if subindex == 2{
			draw_text_color(75,130,global.equipped_accessory1,c_lime,c_lime,c_green,c_green,1)
		}
		else{
			draw_text(75,130,global.equipped_accessory1)
		}

		if subindex == 3{
			draw_text_color(75,150,global.equipped_accessory2,c_lime,c_lime,c_green,c_green,1)
		}
		else{
			draw_text(75,150,global.equipped_accessory2)
		}
		
		if subindex == 4{
			draw_text_color(75,170,global.equipped_accessory3,c_lime,c_lime,c_green,c_green,1)
		}
		else{
			draw_text(75,170,global.equipped_accessory3)
		}
		////
		
		///Draw Soul Options
		if subindex == 0{
			for (i=0;i<ceil(ds_list_size(global.obtained_souls)); i += 1){
				if subsubindex == i{
					//Grab item info and draw
					item = global.obtained_souls[| subsubindex]
					item_info = global.soul_map[? item]
					item_sprite = asset_get_index(string_letters(item_info[? "name"] + "Sprite"))
					
					draw_text_ext(300,160,item_info[? "description"], 12, 84)
					draw_sprite_stretched(item_sprite,0,318,90,48,48)
					if subsubmenu{
						draw_text_color(185,90+20*i,global.obtained_souls[| i],c_lime,c_lime,c_green,c_green,1)
					}
					else{
						draw_text(185,90+20*i,global.obtained_souls[| i])
					}
				}
				else {
					iter_item = global.obtained_souls[| i]
					draw_text(185,90+20*i,iter_item)
				}
			}
		}
		//Draw Armor Options
		if subindex == 1{
			for (i=0;i<ceil(ds_list_size(global.obtained_armors)); i += 1){
				if subsubindex == i{
					//Grab item info and draw
					item = global.obtained_armors[| subsubindex]
					item_info = global.armor_map[? item]
					item_sprite = asset_get_index(string_letters(item_info[? "name"] + "Sprite"))
					
					draw_text_ext(300,160,item_info[? "description"], 12, 84)
					draw_sprite_stretched(item_sprite,0,318,90,48,48)
					if subsubmenu{
						draw_text_color(185,90+20*i,global.obtained_armors[| i],c_lime,c_lime,c_green,c_green,1)
					}
					else{
						draw_text(185,90+20*i,global.obtained_armors[| i])
					}
				}
				else {
					iter_item = global.obtained_armors[| i]
					draw_text(185,90+20*i,iter_item)
				}
			}
		}
		///Draw Accessory Options
		if subindex >= 2{
			for (i=0;i<ceil(ds_list_size(global.obtained_accessories)); i += 1){
				if subsubindex == i{
					//Grab item info and draw
					item = global.obtained_accessories[| subsubindex]
					item_info = global.accessory_map[? item]
					item_sprite = asset_get_index(string_letters(item_info[? "name"] + "Sprite"))
					draw_text_ext(300,160,item_info[? "description"], 12, 84)
					draw_sprite_stretched(item_sprite,0,318,90,48,48)
					if subsubmenu{
						draw_text_color(185,90+20*i,global.obtained_accessories[| i],c_lime,c_lime,c_green,c_green,1)
					}
					else{
						draw_text(185,90+20*i,global.obtained_accessories[| i])
					}
				}
				else {
					iter_item = global.obtained_accessories[| i]
					draw_text(185,90+20*i,iter_item)
				}
			}
		}
	}
	draw_text(100,24,"HP: " + string(hp) + "/" + string(maxhp))
	draw_text(100,44,"MP: " + string(mp) + "/" + string(maxmp))
	draw_text(180,24,"ATT: " + string(attackpower))
	draw_text(180,44,"DEF: " + string(defensepower))
	draw_text(260,24,"LV: " + string(1))
	draw_text(260,44,"To Next: 3234214")
	draw_sprite(MenuPortraitSprite,0,9,8)
}
