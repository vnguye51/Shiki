
if state[| 0] == "walking"{
	if (instance_exists(PlayerObj)){
		if distance_to_object(PlayerObj) < 60{
			ds_list_insert(state,0,"targeting")
		}
		if (PlayerObj.x < x ){
			image_xscale = -1
			hsp = -1
		}
		else {
			image_xscale = 1
			hsp = 1
		}
	}
}

else if state[| 0] == "targeting" {
	ds_list_replace(state,0,"attacking")
	vsp = -4
	sprite_index = BladeSpiderAttack
	if (PlayerObj.x < x ){
			image_xscale = -1
			hsp = -2
		}
	else {
		image_xscale = 1
		hsp = 2
	}
}

if state[| 0] == "attacking" {
	vsp = vsp + 0.1
	if image_index == 2{
		image_speed = 0
	}
	if place_meeting(x,y+1,WallObj) and vsp > 0{
		vsp = 0
		image_speed = 1
		sprite_index = BladeSpiderWalkSprite
		ds_list_delete(state,0)
	}
}

x += hsp
y += vsp

//Destroy instance if health is less than 0
if (hp <= 0)
{
	instance_destroy();
}