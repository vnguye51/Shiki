/// @description confirm

if pause{
	if !submenu{
		if index == 1 and ds_list_size(global.obtained_item_list) > 0 {
			subindex = 0
			submenu = true
		}

		if index == 4 {
			LoadData()
			pause = false
			layer_destroy_instances("MenuLayer")
		}
		else if index == 5 {
			room_goto(TitleRoom)
		}
		else if index == 6 {
			game_end()
		}
	}
	//Item menu actions
	else if menu_options[index] == "Items" {
		curr_item = global.obtained_item_list[| subindex]
		curr_item_count = global.obtained_items[? curr_item]
		curr_item_count = max(0,curr_item_count-1)
		global.obtained_items[? curr_item] = curr_item_count
		if curr_item_count == 0 {
			ds_list_delete(global.obtained_item_list, subindex)
			ds_map_delete(global.obtained_items, curr_item)
			if subindex > ds_list_size(global.obtained_item_list) - 1 {
				subindex = ds_list_size(global.obtained_item_list) - 1
				show_debug_message(subindex)
			}
			if ds_list_size(global.obtained_item_list) == 0 {
				submenu = false
			}
		}
		curr_item_info = global.item_map[? curr_item]
		//show_debug_message(curr_item_info[? "name"])
		UseItem(string_letters(curr_item_info[? "name"]))
	}
	
	else if menu_options[index] == "Equip" {
	}
}

