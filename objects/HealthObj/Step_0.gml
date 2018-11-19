//Inputs

vsp = 0


if (vsp < 6)
{
	vsp += 0.3;
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
y += vsp;


