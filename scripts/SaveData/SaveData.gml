var _root = ds_map_create()
var _room_data = ds_map_create()
var _inventory = ds_map_create()
var _items = ds_map_create()

//List is created alongside the items to retain order of items
var _item_list = ds_list_create()

_items[? "Health Potion"] = 1
_items[? "Mana Potion"] = 1

_item_list[|0] = "Health Potion"
_item_list[|1] = "Mana Potion"

_room_data[? "room"] = room_get_name(room)
_room_data[? "x"] = SavePointObj.x
_room_data[? "y"] = SavePointObj.y - 25

ds_map_add_map(_inventory,"items",_items)
ds_map_add_list(_inventory,"item_list",_item_list)
ds_map_add_map(_root,"room_data",_room_data)
ds_map_add_map(_root,"inventory",_inventory)
ds_map_secure_save(_root,"save.json")
show_debug_message("saved")

ds_map_destroy(_root)