var _root = ds_map_create()
var _room_data = ds_map_create()
_room_data[? "room"] = room_get_name(room)
//Only the room's string is stored
_room_data[? "x"] = SavePointObj.x
_room_data[? "y"] = SavePointObj.y - 25

//_root[? "room_data"] = _room_data
ds_map_add_map(_root,"room_data",_room_data)
ds_map_secure_save(_root,"save.json")
show_debug_message("saved")
ds_map_destroy(_root)