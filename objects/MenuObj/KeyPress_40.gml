if submenu{
	subindex += 2
	if subindex >= array_length_1d(items){
		subindex = 0
	}
}
else{
	index += 1
	if index >= array_length_1d(menu_options){
		index = 0
	}
}