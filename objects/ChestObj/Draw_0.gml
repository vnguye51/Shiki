/// @description Insert description here
// You can write your code in this editor
draw_self()
if opened and anim_timer < 200{
	if item_height <= -26 {
		item_height = -26
		item_alpha = max(0,item_alpha-0.02)
	}
	else{
		item_height = (power((120-anim_timer),2)-14400)/500
	}
	draw_sprite_ext(HealthPotionSprite,0,
		x+sprite_width/2-sprite_get_width(HealthPotionSprite)/2,
		y+sprite_height/2-sprite_get_height(HealthPotionSprite)/2+item_height,1,1,0,image_blend,item_alpha)
	anim_timer += 1
}