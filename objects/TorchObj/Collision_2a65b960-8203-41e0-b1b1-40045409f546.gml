rand = irandom(1)
show_debug_message(rand)
if rand == 0{
	instance_create_depth(x,y,0,ManaObj)
}
else if rand == 1{
	instance_create_depth(x,y,0,HealthObj)
}

instance_destroy()