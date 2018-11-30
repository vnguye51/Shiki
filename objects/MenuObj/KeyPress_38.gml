
if submenu{
	subindex -= 2
	if subindex <= -1{
		subindex = array_length_1d(items) - 1
	}
}
else{
	index -= 1
	if index <= -1{
		index = array_length_1d(menu_options) - 1
	}
}