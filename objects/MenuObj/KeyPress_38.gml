if pause{
	if subsubmenu{
		if menu_options[index] == "Equip"{
			if subindex >= 2{
				//if subindex pointing at accessories
				subsubindex -= 1
				if subsubindex < 0 {
					subsubindex = ds_list_size(global.obtained_accessories) - 1
				}
			}
		}
	}
	else if submenu{
		if menu_options[index] == "Items"{
			subindex -= 2
			if subindex <= -1{
				subindex = ds_list_size(global.obtained_item_list) - 1
			}
		}
		else if menu_options[index] == "Equip"{
			subindex -= 1
			if subindex <= -1{
				subindex = 4
			}
		}
	}
	else{
		index -= 1
		if index <= -1{
			index = array_length_1d(menu_options) - 1
		}
	}
}