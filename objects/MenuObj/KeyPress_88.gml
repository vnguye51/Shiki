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
		basehp = PlayerObj.basehp
		hp = PlayerObj.hp
		maxhp = PlayerObj.maxhp
		basemp = PlayerObj.basemp
		mp = PlayerObj.mp
		maxmp = PlayerObj.maxmp
		baseattack = PlayerObj.baseattack
		basedefense = PlayerObj.basedefense
		attackpower = PlayerObj.attackpower
		defensepower = PlayerObj.defensepower
		instance_deactivate_all(true)
	}
	else{
		pause = false
		instance_activate_all()
		PlayerObj.hp = hp
		PlayerObj.maxhp = maxhp
		PlayerObj.mp = mp
		PlayerObj.maxmp = maxmp
		PlayerObj.attackpower = attackpower
		PlayerObj.defensepower = defensepower
	}
}