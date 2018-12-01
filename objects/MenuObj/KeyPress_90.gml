/// @description confirm

if pause{
	if !submenu{
		if index == 1 {
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
		curr_item_info = global.item_map[? curr_item]
		//show_debug_message(curr_item_info[? "name"])
		UseItem(string_letters(curr_item_info[? "name"]))
	}
}

