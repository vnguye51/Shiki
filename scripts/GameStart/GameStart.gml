instance_create_depth(0,0,0,PlayerObj)
ChangeRoom(room0, 40, 40)


global.obtained_items = ds_map_create()
global.obtained_item_list = ds_list_create()
global.obtained_items[? "Health Potion"] = 2
global.obtained_items[? "Mana Potion"] = 4
global.obtained_item_list[|0] = "Health Potion"
global.obtained_item_list[|1] = "Mana Potion"



//Items and their counts along with a list that retains the order of items

