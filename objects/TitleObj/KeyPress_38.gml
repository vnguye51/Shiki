/// @description Insert description here
// You can write your code in this editor
selector[index].image_blend = c_white
index -= 1
if index == -1{
	index = array_length_1d(selector) - 1 
}
selector[index].image_blend = c_red
