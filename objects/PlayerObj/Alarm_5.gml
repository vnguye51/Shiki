/// @description AttackHitBoxTimer
// You can write your code in this editor
if grounded{
	with (instance_create_depth(x,y,0,PlayerAttack))
	{
		image_xscale = other.image_xscale;
	}
}
else{
	with (instance_create_depth(x,y,0,PlayerJumpAttackObj)){
		image_xscale = other.image_xscale
	}
}