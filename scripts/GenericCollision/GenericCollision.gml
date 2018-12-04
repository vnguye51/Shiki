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
