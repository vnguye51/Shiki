/// @description back
// You can write your code in this editor

if submenu{
	submenu = false
	subindex = -1
}
else {
	if (!pause){
		pause = true;
		hp = PlayerObj.hp
		maxhp = PlayerObj.maxhp
		mp = PlayerObj.mp
		maxmp = PlayerObj.maxmp
		instance_deactivate_all(true)
		instance_create_layer(0,0,"MenuLayer",MenuBackgroundObj)
	}
	else{
		pause = false
		layer_destroy_instances("MenuLayer")
		instance_activate_all()
	}
}