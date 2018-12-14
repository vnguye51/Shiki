/// @description confirm

if pause{
	//if !submenu{
	//	if index == 1 and ds_list_size(global.obtained_item_list) > 0 {
	//		subindex = 0
	//		submenu = true
	//	}
	//	if menu_options[index] == "Equip"{
	//		subindex = 0
	//		submenu = true
	//	}
	if menu_options[index] == "Status" {
	}
	
	//Item menu actions
	else if menu_options[index] == "Items" {
		if submenu == true{
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
		else {
			if index == 1 and ds_list_size(global.obtained_item_list) > 0 {
				subindex = 0
				submenu = true
			}
		}
	}
	else if menu_options[index] == "Equip" {
		if subsubmenu == true{
			var target_item = global.obtained_accessories[| subsubindex]
			if subindex == 2{
				show_debug_message(target_item)
				if global.equipped_accessory1 == target_item{
					global.equipped_accessory1 = "----"
				}
				else if global.equipped_accessory2 == target_item{
					global.equipped_accessory2 = global.equipped_accessory1
					global.equipped_accessory1 = target_item
				}
				else if global.equipped_accessory3 == target_item{
					global.equipped_accessory3 = global.equipped_accessory1
					global.equipped_accessory1 = target_item
				}
				else{
					global.equipped_accessory1 = target_item
				}
			}
			else if subindex == 3 {
				if global.equipped_accessory2 == target_item{
					global.equipped_accessory2 = "----"
				}
				else if global.equipped_accessory1== target_item{
					global.equipped_accessory1 = global.equipped_accessory2
					global.equipped_accessory2 = target_item
				}
				else if global.equipped_accessory3 == target_item{
					global.equipped_accessory3 = global.equipped_accessory2
					global.equipped_accessory2 = target_item
				}
				else{
					global.equipped_accessory2 = target_item
				}
			}
			else if subindex == 4{
				if global.equipped_accessory3 == target_item{
					global.equipped_accessory3 = "----"
				}
				else if global.equipped_accessory1== target_item{
					global.equipped_accessory1 = global.equipped_accessory3
					global.equipped_accessory3 = target_item
				}
				else if global.equipped_accessory2 == target_item{
					global.equipped_accessory2 = global.equipped_accessory3
					global.equipped_accessory3 = target_item
				}
				else{
					global.equipped_accessory3 = target_item
				}
			}
			acc1 = global.accessory_map[? global.equipped_accessory1]
			acc2 = global.accessory_map[? global.equipped_accessory2]
			acc3 = global.accessory_map[? global.equipped_accessory3]
			maxmp = basemp + acc1[? "mp"] + acc2[? "mp"] + acc3[? "mp"]
		}
		else if submenu == true{
			subsubindex = 0
			subsubmenu = true
		}
		else{
			subindex = 0
			submenu = true
		}
	}
	else if menu_options[index] == "Load"{
		LoadData()
		pause = false
		layer_destroy_instances("MenuLayer")
	}
	else if menu_options[index] == "Title" {
		room_goto(TitleRoom)
	}
	else if menu_options[index] == "Quit" {
		game_end()
	}
}

