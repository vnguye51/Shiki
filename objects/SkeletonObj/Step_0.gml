if (instance_exists(PlayerObj))
{
	if (PlayerObj.x < x ){
		image_xscale = -1
		hsp = -1
	}
	else {
		image_xscale = 1
		hsp = 1
	}
}

x = x + hsp
y = y + vsp

if (hp <= 0)
{
	instance_destroy();
}