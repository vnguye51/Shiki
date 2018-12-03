save_data = ds_map_secure_load("save.json")
room_data = save_data[? "room_data"]
instance_create_depth(0,0,0,PlayerObj)
ChangeRoom(asset_get_index(room_data[? "room"]), room_data[? "x"], room_data[? "y"])

inventory = save_data[? "inventory"]
global.obtained_items = inventory[? "items"]
global.obtained_item_list = inventory[? "item_list"]
//show_debug_message(global.obtained_items[? "Health Potion"])
//show_debug_message(global.obtained_item_list[|0])
