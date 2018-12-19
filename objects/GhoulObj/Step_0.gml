if (instance_exists(PlayerObj)){
	///Flip the sprite to the player's direction
	if image_index%4 == 0 and image_index<=8{
		x += 2*image_xscale
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


if (hp <= 0){
	instance_destroy();
}