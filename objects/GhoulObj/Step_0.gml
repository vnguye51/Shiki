if hp>0{
	if (instance_exists(PlayerObj)){
		if floor(image_index)%4 == 0 and floor(image_index)<=8 and !moved{
			moved = true
			if not place_meeting(x+2*image_xscale,y+1,WallObj){
				//If not touching the ground
				image_xscale *= -1
			}
			if place_meeting(x+2*image_xscale,y,WallObj){
				//If you are going to touch the wall
				image_xscale *= -1
			}
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
	mask_index = EmptySprite
}