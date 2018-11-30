save_data = ds_map_secure_load("save.json")
room_data = save_data[? "room_data"]
instance_create_depth(0,0,0,PlayerObj)
ChangeRoom(asset_get_index(room_data[? "room"]), room_data[? "x"], room_data[? "y"])
