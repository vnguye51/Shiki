/// @description Insert description here
// You can write your code in this editor
if image_xscale == 1{
	hspd = 1
}
else{
	hspd = -1
}

x += hspd

if (hp <= 0)
{
	instance_destroy();
}