if first_creation{
	first_creation = false
	if (instance_exists(PlayerObj)){
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


if place_meeting(x,y+1,WallObj) and vsp > 0{
		grounded = true
}
else{
	grounded = false
}

if state[| 0] == "walking"{
	if (instance_exists(PlayerObj)){
		if distance_to_object(PlayerObj) < 80 and sign(PlayerObj.x-x) == sign(image_xscale){
			ds_list_insert(state,0,"attackprep")
			alarm[0] = 20
			image_index = 0
			sprite_index = BladeSpiderAttack
			hsp = 0
		}
	}
}

else if state[| 0] == "attackprep" {
	if image_index == 1{
		image_speed = 0
	}
}

else if state[| 0] == "attacking" {
	hsp = image_xscale*3
	vsp = vsp + 0.1
	if grounded{
		hsp=0
		vsp = 0
		image_speed = 1
		alarm[1] = 15
		ds_list_replace(state,0,"idle")
	}
}

//Horizontal Collision
if (place_meeting(x+hsp,y,WallObj))
{	
	//Corner forgiveness
	if not (place_meeting(x+hsp,y-1,CollisionObj) or place_meeting(x+hsp,y-1,OneWayObj))
	{
		y += -1
	}
	else{	
		while(not place_meeting(x+sign(hsp),y,WallObj))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}
	if grounded{
		image_xscale = image_xscale*-1
		hsp = image_xscale
	}
}



//Vertical Collision
if (place_meeting(x,y+vsp,WallObj))
{
	while(not place_meeting(x,y+sign(vsp),WallObj))
	{
		y += sign(vsp);

	}
	vsp = 0;
}


//One Way Collision
var OneWay = instance_place(x, y+vsp, OneWayObj)
if OneWay != noone
{
	//Falling and starting above the platform
	if vsp > 0 and (round(y + 25) < OneWay.y) 
	{
		while(not place_meeting(x,y+sign(vsp),OneWayObj))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
}

if (grounded and hsp < 0 and place_meeting(x+hsp, y+6,SlopeObj) and jumping == false)
{
	while(not place_meeting(x+hsp,y+1,SlopeObj))
	{
		y += 1;
	}
	vsp = 0
}

	
//Moving Platform Collision
var MovingPlatform = instance_place(x,y+1,MovingPlatformObj)
if MovingPlatform != noone
{
	if grounded == true
	{
		if (MovingPlatform.path_position < 0.999 and MovingPlatform.path_position > 0.001)
		{
			hsp += MovingPlatform.path_speed
		}
		else{
			hsp += MovingPlatform.path_speed*-1
		}
	}
}



x += hsp
y += vsp

//Destroy instance if health is less than 0
if (hp <= 0)
{
	instance_destroy();
}