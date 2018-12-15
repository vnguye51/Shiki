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


//Initialize parent inventory map
var _inventory = ds_map_create()
//Add item data to save data
var _items = ds_map_create()
var _obtained_items = ds_map_create()
var _obtained_item_list = ds_list_create()
var _obtained_accessories = ds_list_create()
var _obtained_souls = ds_list_create()
var _obtained_armors = ds_list_create()
ds_map_copy(_obtained_items,global.obtained_items)
ds_list_copy(_obtained_item_list,global.obtained_item_list)
ds_list_copy(_obtained_accessories,global.obtained_accessories)
ds_list_copy(_obtained_souls,global.obtained_souls)
ds_list_copy(_obtained_armors,global.obtained_armors)

ds_map_add_map(_inventory,"items",_obtained_items)
ds_map_add_list(_inventory,"item_list",_obtained_item_list)

ds_map_add_list(_inventory,"accessories",_obtained_accessories)
ds_map_add_list(_inventory,"souls",_obtained_souls)
ds_map_add_list(_inventory,"armors",_obtained_armors)

_inventory[? "equipped_soul"] = global.equipped_soul
_inventory[? "equipped_armor"] = global.equipped_armors
_inventory[? "equipped_acc1"] = global.equipped_accessory1
_inventory[? "equipped_acc2"] = global.equipped_accessory2
_inventory[? "equipped_acc3"] = global.equipped_accessory3

ds_map_add_map(_root,"inventory",_inventory)

var _equipment = ds_map_create()

//Save data to system
ds_map_secure_save(_root,"save.json")
show_debug_message("saved")

ds_map_destroy(_root)