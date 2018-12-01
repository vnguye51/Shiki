if pause{
	if submenu{
		subindex += 2
		if subindex >= ds_list_size(global.obtained_item_list){
			subindex = 0
		}
	}
	else{
		index += 1
		if index >= array_length_1d(menu_options){
			index = 0
		}
	}
}