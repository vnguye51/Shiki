if index == 4 {
	LoadData()
	pause = false
	layer_destroy_instances("MenuLayer")
}
else if index == 5 {
	room_goto(TitleRoom)
}
else if index == 6 {
	game_end()
}
