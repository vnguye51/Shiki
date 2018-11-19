if (instance_exists(PlayerObj))
{
	move_towards_point(PlayerObj.x,y,walksp);
}



if (hp <= 0)
{
	instance_destroy();
}