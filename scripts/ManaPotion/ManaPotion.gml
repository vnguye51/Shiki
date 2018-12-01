instance_activate_object(PlayerObj)
PlayerObj.mp = min(PlayerObj.maxmp,PlayerObj.mp + 20)

//Update the menu's view of player stats
MenuObj.mp = PlayerObj.mp

instance_deactivate_object(PlayerObj)
show_debug_message("Mana pot used")