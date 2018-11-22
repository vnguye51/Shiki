//Inputs

if control == true
{
	key_right = keyboard_check(vk_right);
	key_left = -keyboard_check(vk_left);
	key_down = keyboard_check(vk_down);
	key_jump = keyboard_check(vk_control);
	key_jump_pressed = keyboard_check_pressed(vk_control);
	key_space = keyboard_check_pressed(vk_space);
	
	key_shift = keyboard_check_pressed(vk_shift)
}
else
{
	key_right = false
	key_left = false
	key_jump = false
	key_jump_pressed = false
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
	


on_slope = false
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
var OneWay = instance_place(x, y+3, OneWayObj)
if (place_meeting(x,y+3,CollisionObj))
{
	if(vsp > 0)
	{
		if grounded == false
		{
		audio_play_sound(StepSFX,0,0)
		}
		grounded = true
		jumps_left = 2
	}
	if (key_jump_pressed == true and key_down == false and grounded == true) //initialize jumping
	{
		jumps_left += -1
		jumping = true
		alarm[4] = 15
	}
}  


else if OneWay != noone
{
	if vsp > 0 and (round(y + 25) < OneWay.y)
	{
		if grounded == false
		{
		audio_play_sound(StepSFX,0,0)
		}
		grounded = true
		jumps_left = 2
	}
	if (key_jump_pressed == true) and key_down == false and grounded == true //initialize jumping
	{
		jumps_left += -1
		jumping = true
		alarm[4] = 15
	}
}  

else 
{
	if key_jump_pressed and jumps_left > 0
	{
		jumps_left += -1
		jumping = true
		alarm[4] = 15
	}
	grounded = false
}

//=======================================

//Jumping Logic
if (jumping == true)
{
	if (key_jump == true ) //Check to see if player is still jumping
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

//Corner forgiveness
if (place_meeting(x,y,OneWayObj))
{
	if not place_meeting(x,y-1,OneWayObj)
	{
		y += -1
	}
}

//Vertical Collision
if (place_meeting(x,y+vsp,WallObj))
{
	while(not place_meeting(x,y+sign(vsp),WallObj))
	{
		y += sign(vsp);

	}
	vsp = 0;
}


//One Way Collision
var OneWay = instance_place(x, y+vsp, OneWayObj)
if OneWay != noone
{
	//Falling and starting above the platform
	if key_down and key_jump_pressed
	{
		y += 1
		grounded = false
	}
	if vsp > 0 and (round(y + 25) < OneWay.y) 
	{
		while(not place_meeting(x,y+sign(vsp),OneWayObj))
		{
			y += sign(vsp);
		}
		vsp = 0;
	}
}
	 
	
//Moving Platform Collision
var MovingPlatform = instance_place(x,y+1,MovingPlatformObj)
if MovingPlatform != noone
{
	if grounded == true
	{
		if (MovingPlatform.path_position < 0.999 and MovingPlatform.path_position > 0.001)
		{
			hsp += MovingPlatform.path_speed
		}
		else{
			show_debug_message("correction")
			hsp += MovingPlatform.path_speed*-1
		}
	}
}

//Slope Collision
//LeftSlope Collision
if (grounded and move == -1 and place_meeting(x+hsp, y+4,SlopeObj) and key_jump == false)
{
	while(not place_meeting(x+hsp,y+1,SlopeObj))
	{
		y += 1;
	}
	vsp = 0
}

if (place_meeting(x,y+vsp,SlopeObj) and key_jump == false)
{
	while(not place_meeting(x,y+sign(vsp),SlopeObj))
	{
		y += 1;
	}
	vsp = 0;
	if (move == 1)
	{
		hsp = 2
	}
	else if (move == -1)
	{
		hsp = -2
		while(not place_meeting(x+hsp,y+1,SlopeObj) and (not place_meeting(x+hsp,y+1,WallObj)))
		{
			y += 1;
		}
	}
	if (place_meeting(x+hsp,y,WallObj))
	{
		while(place_meeting(x+hsp,y,WallObj))
		{
			y += -1;
		}
	}
}

if (place_meeting(x+hsp,y,SlopeObj))
{
	while(place_meeting(x+hsp,y,SlopeObj))
	{
		y += -1;
	}
}

//Right Slope Collision
if (grounded and move == 1 and place_meeting(x+hsp, y+4,SlopeObjRight) and key_jump == false)
{
	while(not place_meeting(x+hsp,y+1,SlopeObjRight))
	{
		y += 1;
	}
	vsp = 0
}

if (place_meeting(x,y+vsp,SlopeObjRight) and key_jump == false)
{
	while(not place_meeting(x,y+sign(vsp),SlopeObjRight))
	{
		y += 1;
	}
	vsp = 0;
	if (move == -1)
	{
		hsp = -2
	}
	else if (move == 1)
	{
		hsp = 2
		while(not place_meeting(x+hsp,y+1,SlopeObjRight) and (not place_meeting(x+hsp,y+1,WallObj)))
		{
			y += 1;
		}
	}
	if (place_meeting(x+hsp,y,WallObj))
	{
		while(place_meeting(x+hsp,y,WallObj))
		{
			y += -1;
		}
	}
}


if (place_meeting(x+hsp,y,SlopeObjRight))
{
	while(place_meeting(x+hsp,y,SlopeObjRight))
	{
		y += -1;
	}
}

x += hsp;
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
		if(move == 1){
			image_xscale = 1
		}
		else if (move == -1){
			image_xscale = -1
		}
		if (sign(vsp) > 0)
		{
			sprite_index = PlayerFallSprite
			if (image_index == 8){
				image_index = 6
			}
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
