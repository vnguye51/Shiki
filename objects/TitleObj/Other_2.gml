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

global.soul_map = ds_map_create()
sword = ds_map_create()
sword[? "name"] = "Sword"
sword[? "description"] = "A plain, slightly dull sword"
ds_map_add_map(global.soul_map,"Sword",sword)

global.accessory_map = ds_map_create()
blue_earring = ds_map_create()
blue_earring[? "name"] = "Blue Earring"
blue_earring[? "description"] = "Azure earrings. Increases magical prowess. +10 MP"
blue_earring[? "unique"] = false
blue_earring[? "mp"] = 10
ds_map_add_map(global.accessory_map,"Blue Earring",blue_earring)

skull_pendant = ds_map_create()
skull_pendant[? "name"] = "Skull Pendant"
skull_pendant[? "description"] = "Skull of some small being. Increases attack power when in danger."
skull_pendant[? "unique"] = true
skull_pendant[? "trigger"] = "Damage"
skull_pendant[? "mp"] = 0
ds_map_add_map(global.accessory_map,"Skull Pendant",skull_pendant)

no_accessory = ds_map_create()
no_accessory[? "name"] = "----"
no_accessory[? "mp"] = 0
ds_map_add_map(global.accessory_map,"----",no_accessory)

global.armor_map = ds_map_create()
cloth = ds_map_create()
cloth[? "name"] = "Cloth"
cloth[? "description"] = "The weakest of armors. +5 Def"
cloth[? "def"] = 5
ds_map_add_map(global.armor_map,"Cloth",cloth)