//Generate root node for JSON
var _root = ds_map_create()


//room name and x and y coordinate of spawnpoint
var _room_data = ds_map_create()
_room_data[? "room"] = room_get_name(room)
_room_data[? "x"] = SavePointObj.x
_room_data[? "y"] = SavePointObj.y - 25
ds_map_add_map(_root,"room_data",_room_data)

//monsterpedia (and maybe items later)
var _encyclopedia = ds_map_create()

//Add item data to save data
var _items = ds_map_create()
var _inventory = ds_map_create()
var _obtained_items = ds_map_create()
var _obtained_item_list = ds_list_create()
ds_map_copy(_obtained_items,global.obtained_items)
ds_list_copy(_obtained_item_list,global.obtained_item_list)
ds_map_add_map(_inventory,"items",_obtained_items)
ds_map_add_list(_inventory,"item_list",_obtained_item_list)
ds_map_add_map(_root,"inventory",_inventory)


//Save data to system
ds_map_secure_save(_root,"save.json")
show_debug_message("saved")

ds_map_destroy(_root)