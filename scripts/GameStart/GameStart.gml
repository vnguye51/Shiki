instance_create_depth(0,0,0,PlayerObj)
ChangeRoom(room0, 40, 40)


global.obtained_items = ds_map_create()
global.obtained_item_list = ds_list_create()
global.obtained_items[? "Health Potion"] = 2
global.obtained_items[? "Mana Potion"] = 4
global.obtained_item_list[|0] = "Health Potion"
global.obtained_item_list[|1] = "Mana Potion"

global.obtained_equipment = ds_map_create()

global.obtained_souls = ds_list_create()
global.obtained_souls[|0] = "Sword"
global.equipped_soul = "Sword"


global.obtained_armors = ds_list_create() 
global.obtained_armors[| 0] = "Cloth"
global.equipped_armors = "Cloth"


global.obtained_accessories = ds_list_create()
global.obtained_accessories[| 0] = "Blue Earring"
global.obtained_accessories[| 1] = "Skull Pendant"


global.equipped_accessory1 = "Blue Earring" 
global.equipped_accessory2 = "Skull Pendant"
global.equipped_accessory3 = "----"




//Items and their counts along with a list that retains the order of items

