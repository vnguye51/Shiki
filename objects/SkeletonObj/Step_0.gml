if (instance_exists(PlayerObj))
{
	if state == "attacking"{
		if image_index >= 10{
			image_speed = 0
		}
		else{
			image_speed = 1
		}
		sprite_index = SkeletonAttackSprite
		hsp = 0
		if (PlayerObj.x < x){
			image_xscale = -1
		}
		else{
			image_xscale = 1
		}
	}
	else{
		sprite_index = SkeletonWalkSprite
		if(abs(PlayerObj.x-x) < 38){
			image_index = 0
			state = "attacking"
			alarm[0] = 60
		}
	///Flip the sprite to the player's direction
		else if (PlayerObj.x < x ){
			image_speed = 0.5
			if image_xscale == 1{
				turn_speed -= 1
				if turn_speed == 0{
					image_xscale = -1
					turn_speed = 30
					hsp = -walksp
				}
			}
			else{
				turn_speed = 30
			}
		}
		else{
			image_speed = 0.5
			if image_xscale == -1{
				turn_speed -= 1
				if turn_speed == 0{
					image_xscale = 1
					hsp = walksp
				}
			}
			else{
				turn_speed = 30
			}
		}
	}
}


x = x + hsp
y = y + vsp

if (hp <= 0){
	instance_destroy();
}