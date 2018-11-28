time = 0
textindex += 1

if textindex < array_length_1d(text) and text[textindex] == "/" {
	textindex += 1
	temp = right_char.col
	right_char.col = left_char.col
	left_char.col = temp
}