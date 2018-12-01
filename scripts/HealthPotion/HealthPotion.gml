instance_activate_object(PlayerObj)
PlayerObj.hp = min(PlayerObj.maxhp,PlayerObj.hp + 20)
instance_deactivate_object(PlayerObj)
show_debug_message("Health pot used")