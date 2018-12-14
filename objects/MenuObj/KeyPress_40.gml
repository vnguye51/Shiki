if pause{
	if subsubmenu{
		if menu_options[index] == "Equip"{
			if subindex >= 2{
				//if subindex pointing at accessories
				subsubindex += 1
				if subsubindex >= ds_list_size(global.obtained_accessories){
					subsubindex = 0
				}
			}
		}
	}
	else if submenu{
		if menu_options[index] == "Items"{
			subindex += 2
			if subindex >= ds_list_size(global.obtained_item_list){
				subindex = 0
			}
		}
		else if menu_options[index] == "Equip"{
			subindex += 1
			if subindex >= 5{
				subindex = 0
			}
		}
	}
	else{
		index += 1
		if index >= array_length_1d(menu_options){
			index = 0
		}
	}
}