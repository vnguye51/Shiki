
if ds_map_exists(global.obtained_items, argument0){
	global.obtained_items[? argument0] += 1
}
else{
	global.obtained_items[? argument0] = 1
	ds_list_add(global.obtained_item_list,argument0)
}

