if pause{
	if submenu{
		if menu_options[index] == "Items"{
			subindex += 1
			if subindex >= ds_list_size(global.obtained_item_list){
				subindex = 0
			}
		}
	}
}