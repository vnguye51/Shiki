if !persistent{
	persistent = true;
}

grav = 0.2
hsp = 0;
vsp = 0;
jumpspeed = 7;
movespeed = 3;

jumps_left = 1

mp = 50
hp = 50
maxmp = 100
maxhp = 100

grounded = true;
on_slope = false;
invuln = false;
control = true;
alive = true;
injured = false;
crouching = true;
attacking = false;
magicattacking = false
jumping = false;
dodging = false;
sliding = false;
//Values in previous frame
PrevSprite = sprite_index

//Key Controls
	key_right = false;
	key_left = false;
	key_down = false;
	key_up = false;
	key_jump = false;
	key_jump_pressed = false;
	key_space = false;
	key_z_pressed = false;
	key_shift_pressed = false;
	key_control_pressed = false;
	