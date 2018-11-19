//Inputs

if control == true
{
	key_right = keyboard_check(vk_right);
	key_left = -keyboard_check(vk_left);
	key_down = keyboard_check(vk_down);
	key_jump = keyboard_check(vk_control);
	key_space = keyboard_check_pressed(vk_space)
	key_shift = keyboard_check_pressed(vk_shift)
}
else
{
	key_right = false
	key_left = false
	key_jump = false
	key_down = false
	key_space = false
	key_shift = false
}


//Exception to the loss of control due to attacking. Attacking(space) and Dodging(shift) can be performed earlier than other actions.
if (attacking == true) and (alarm_get(2) <= 15) 
{
	key_space = keyboard_check_pressed(vk_space)
	key_shift = keyboard_check_pressed(vk_shift)
}
	



move = key_left + key_right
hsp = move*movespeed




//==============================
//Gravity

if (vsp < 6)
{
	vsp += grav;
}
//======================================
//Check if the player is on the ground
if (place_meeting(x,y+1,WallObj))
{
	if grounded == false
	{
	audio_play_sound(StepSFX,0,0)
	}
	grounded = true
	if (key_jump == true) //initialize jumping
	{
		jumping = true
		alarm[4] = 15
	}
}  
else 
{
	grounded = false
}
//=======================================
//Jumping Logic
if (jumping == true)
{
	if (key_jump == true) //Check to see if player is still jumping
	{
		vsp = key_jump * -jumpspeed
	}
	else
	{
		jumping = false
		vsp = 0
	}
}
//==================================================
//key_down takes precedence over movement while on the ground
if (key_down == true and grounded == true)
{
	move = 0
	hsp = 0
	crouching = true
}
else
{
	crouching = false
}
//=======================================================
if (key_space == true and grounded == true)
{
	move = 0
	hsp = 0
	attacking = true
	control = false
	alarm[2] = 30
	alarm[5] = 12 //Attack starts on the 3rd frame, game speed is 60fps animation speed is 15fps
	image_index = 0
		
}

//Horizontal Collision
if (place_meeting(x+hsp,y,WallObj))
{	
	while(not place_meeting(x+sign(hsp),y,WallObj))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;
//Vertical Collision
if (place_meeting(x,y+vsp,WallObj))
{
	while(not place_meeting(x,y+sign(vsp),WallObj))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
show_debug_message(vsp)
y += vsp;

if (place_meeting(x,y,EnemyObj)) //Might want to move this code into the enemy later
{
	if invuln == false
	{
		invuln = true
		hp = max(hp-10,0)
		if hp <= 0
		{
			alive = false
			control = false
			hsp = 0
		}	
		else
		{
			alarm[0] = 60
			alarm[1] = 20
			control = false
			injured = true
			hsp = 0
		}
		
	}
}

// ANIMATIONS//
PrevSprite = sprite_index
image_speed = 1


if (alive == true) 
{	if injured == true
	{  
		sprite_index = PlayerInjurySprite
		if (image_index ==  3)
		{
			image_speed = 0
		}
	}
	
	
	else if (grounded == false)
	{
	
		if (sign(vsp) > 0)
		{
			sprite_index = PlayerFallSprite
		}
		else
		{
			sprite_index = PlayerJumpSprite
		}
	}

	else 
	{
		if (attacking == true)
		sprite_index = PlayerAttackSprite
		
		
		else if (crouching == true)
		{
			sprite_index = PlayerCrouchSprite
			if (image_index = 4)
			{
				image_speed = 0
			}
		}
		else if (move == 1)
		{
			sprite_index = PlayerRunSprite
			image_xscale = 1
		}
		else if (move == -1)
		{
			sprite_index = PlayerRunSprite
			image_xscale = -1
		}
		else 
			{
				if (sprite_index = PlayerAttackSprite)
				{
					if (image_index == 9)
					{
						sprite_index = PlayerIdleSprite
					}
				}
				else
				{
					sprite_index = PlayerIdleSprite
				}
			}
	}
}

else
{
	
	sprite_index = PlayerDeathSprite
	if (image_index ==  18)
	{
		image_speed = 0
	}
}

if (PrevSprite != sprite_index) //Frame is reset to 0 if image is changed
{
	image_index = 0
}
