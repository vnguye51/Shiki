if pause{
	if submenu{
		subindex -= 2
		if subindex <= -1{
			subindex = ds_list_size(global.obtained_item_list) - 1
		}
	}
	else{
		index -= 1
		if index <= -1{
			index = array_length_1d(menu_options) - 1
		}
	}
}