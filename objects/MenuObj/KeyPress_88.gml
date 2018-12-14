/// @description back
// You can write your code in this editor

if subsubmenu{
	subsubmenu = false
	subsubindex = 0
}
else if submenu{
	submenu = false
	subindex = 0
}
else {
	if (!pause){
		pause = true;
		hp = PlayerObj.hp
		maxhp = PlayerObj.maxhp
		mp = PlayerObj.mp
		maxmp = PlayerObj.maxmp
		attackpower = PlayerObj.attackpower
		defensepower = PlayerObj.defensepower
		instance_deactivate_all(true)
	}
	else{
		pause = false
		instance_activate_all()
	}
}