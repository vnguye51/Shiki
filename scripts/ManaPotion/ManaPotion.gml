instance_activate_object(PlayerObj)
PlayerObj.mp = min(PlayerObj.maxmp,PlayerObj.mp + 20)
instance_deactivate_object(PlayerObj)
show_debug_message("Mana pot used")