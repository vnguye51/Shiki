save_data = ds_map_secure_load("save.json")
room_data = save_data[? "room_data"]
instance_create_depth(0,0,0,PlayerObj)
ChangeRoom(asset_get_index(room_data[? "room"]), room_data[? "x"], room_data[? "y"])

inventory = save_data[? "inventory"]
global.obtained_items = inventory[? "items"]
global.obtained_item_list = inventory[? "item_list"]
global.obtained_souls = inventory[? "souls"]
global.obtained_armors = inventory[? "armors"]
global.obtained_accessories = inventory[? "accessories"]

global.equipped_soul = inventory[? "equipped_soul"]
global.equipped_armors = inventory[? "equipped_armor"]
global.equipped_accessory1 = inventory[? "equipped_acc1"]
global.equipped_accessory2 = inventory[? "equipped_acc2"]
global.equipped_accessory3 = inventory[? "equipped_acc3"]

//show_debug_message(global.obtained_items[? "Health Potion"])
//show_debug_message(global.obtained_item_list[|0])
