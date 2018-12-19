if hp>0{
	if (instance_exists(PlayerObj)){
		///Flip the sprite to the player's direction
		show_debug_message(moved)
		show_debug_message(floor(image_index))
		if floor(image_index)%4 == 0 and floor(image_index)<=8 and !moved{
			moved = true
			x += 2*image_xscale
		}
		else if floor(image_index)%4 != 0{
			moved = false
		}
		if image_index == 12{
			if(PlayerObj.x > x){
				image_xscale = 1
			}
			else{
				image_xscale = -1
			}
		}
	}
}


else{
	if state != "dead"{
		image_index = 0
		state = "dead"
	}
	if image_index >= 11{
		image_speed = 0
	}
	sprite_index = GhoulDeathSprite
}