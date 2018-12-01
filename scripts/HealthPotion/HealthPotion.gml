instance_activate_object(PlayerObj)
PlayerObj.hp = min(PlayerObj.maxhp,PlayerObj.hp + 20)

//Update the menu's view of player stats
MenuObj.hp = PlayerObj.hp

instance_deactivate_object(PlayerObj)
show_debug_message("Health pot used")