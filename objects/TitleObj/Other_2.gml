//I should probably turn this into a JSON and import it at some point

global.item_map = ds_map_create()

hppot = ds_map_create()
hppot[? "name"] = "Health Potion"
hppot[? "description"] = "A crimson-red concoction. Heals 20HP."
hppot[? "usable"] = true
hppot[? "consumable"] = true
ds_map_add_map(global.item_map,"Health Potion",hppot)

hppot = ds_map_create()
hppot[? "name"] = "Health Potion"
hppot[? "description"] = "A crimson-red concoction. Heals 20HP."
hppot[? "usable"] = true
hppot[? "consumable"] = true
ds_map_add_map(global.item_map,"Health Potion",hppot)

mppot = ds_map_create()
mppot[? "name"] = "Mana Potion"
mppot[? "description"] = "An azure-blue concoction. Heals 20MP."
mppot[? "usable"] = true
mppot[? "consumable"] = true
ds_map_add_map(global.item_map,"Mana Potion",mppot)

mirror = ds_map_create()
mirror[? "name"] = "Pocket Mirror"
mirror[? "description"] = "A simple mirror etched with a magic rune. Returns user to town."
mirror[? "usable"] = true
mirror[? "consumable"] = false
ds_map_add_map(global.item_map,"Mirror",mirror)

