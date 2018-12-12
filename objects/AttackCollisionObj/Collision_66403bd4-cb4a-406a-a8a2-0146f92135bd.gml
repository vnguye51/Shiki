/// @description Insert description here
// You can write your code in this editor
with (other)
{
	hp -= 10;
	flash = 10;
	var text = instance_create_depth(x,y,1,DamageTextObj)
	text.damage = 10
	text.x = x + sprite_width/2
	text.y = y + sprite_height/2
}
