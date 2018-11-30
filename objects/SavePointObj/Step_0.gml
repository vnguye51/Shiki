if place_meeting(x,y,PlayerObj){
	draw_text(x+7,y+sprite_height,"UP")
	if keyboard_check_pressed(vk_up){
		PlayerObj.hp = 100
		PlayerObj.mp = 100
		SaveData()
	}	
}