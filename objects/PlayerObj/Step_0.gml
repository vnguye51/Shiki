//Inputs

if control == true
{
	key_right = keyboard_check(vk_right);
	key_left = -keyboard_check(vk_left);
	key_down = keyboard_check(vk_down);
	key_up = keyboard_check(vk_up)
	key_jump = keyboard_check(vk_control);
	key_jump_pressed = keyboard_check_pressed(vk_control);
	key_space = keyboard_check_pressed(vk_space);
	key_control_pressed = keyboard_check_pressed(vk_control);
	key_shift_pressed = keyboard_check_pressed(vk_shift);
}
else
{
	key_right = false
	key_left = false
	key_jump = false
	key_up = false
	key_jump_pressed = false
	key_down = false
	key_space = false
	key_shift_pressed = false
}


//Exception to the loss of control due to attacking. Attacking(space) and Dodging(shift) can be performed earlier than other actions.
if (attacking == true)
{
	if (alarm_get(2) <= 15){
		key_space = keyboard_check_pressed(vk_space)
	}
	if (alarm_get(2) <= 25){
		//Cancel the attack and stop its timers
		key_shift_pressed = keyboard_check_pressed(vk_shift)
		if key_shift_pressed{
			alarm[2] = -1
			alarm[5] = -1
			attacking = false
		}
	}
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
		jumps_left = 1
	}
	if (key_jump_pressed == true and key_down == false and grounded == true) //initialize jumping
	{
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
		jumps_left = 1
	}
	if (key_jump_pressed == true) and key_down == false //initialize jumping
	{
		if grounded == false{
			jumps_left += -1
		}
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
else if sliding == false
{
	crouching = false
}
//=======================================================
///Attacking Logic
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

//Dodging Logic
if (key_shift_pressed == true and grounded == true)
{
	dodging = true
	control = false
	alarm[3] = 27
}

if dodging{
	if image_xscale == 1{
		hsp = -5 + power(27-alarm_get(3),2)/729*5
	}
	else{
		hsp = 5 - power(27-alarm_get(3),2)/729*5
	}
	//Dodging can be stopped or triggered by other means than the above
}

//Sliding Logic
if (grounded == true and crouching == true and key_control_pressed)
{
	crouching = false
	sliding = true
	control = false
	alarm[6] = 27
}

if sliding{
	if image_xscale == 1{
		hsp = 5 - power(27-alarm_get(6),2)/729*5
	}
	else{
		hsp = -5 + power(27-alarm_get(6),2)/729*5
	}
	//Dodging can be stopped or triggered by other means than the above
}

//Horizontal Collision
if (place_meeting(x+hsp,y,WallObj))
{	
	//Corner forgiveness
	if not (place_meeting(x+hsp,y-1,CollisionObj) or place_meeting(x+hsp,y-1,OneWayObj))
	{
		y += -1
	}
	else{	
		while(not place_meeting(x+sign(hsp),y,WallObj))
		{
			x += sign(hsp);
		}
		hsp = 0;
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
			hsp += MovingPlatform.path_speed*-1
		}
	}
}

//Slope Collision
//LeftSlope Collision
if (grounded and hsp < 0 and place_meeting(x+hsp, y+6,SlopeObj) and jumping == false)
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
		while(not place_meeting(x+hsp,y+1,SlopeObj) and (not place_meeting(x+hsp,y+1,WallObj)) and (not place_meeting(x+hsp,y+1,OneWayObj)))
		{
			y += 1;
		}
	}
	if (place_meeting(x+hsp,y,WallObj) and (not place_meeting(x+hsp,y-2,WallObj)))
	//Adds some forgiveness to get on top of a nearby wallobject when coming off a slope
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
if (grounded and hsp > 0 and place_meeting(x+hsp, y+6,SlopeObjRight) and jumping == false)
//If moving down the slope
{
	while(not place_meeting(x+hsp,y+1,SlopeObjRight))
	{
		y += 1;
	}
	vsp = 0
}
//If there is a collision downwards
if (place_meeting(x,y+vsp,SlopeObjRight) and key_jump == false)
{
	while(not place_meeting(x,y+sign(vsp),SlopeObjRight))
	{
		y += 1;
	}
	vsp = 0;
	if (move == -1)
	//if moving up the slope
	{
		hsp = -2
	}
	else if (move == 1)
	//if moving down the slope
	{
		hsp = 2
		while(not place_meeting(x+hsp,y+1,SlopeObjRight) and (not place_meeting(x+hsp,y+1,WallObj)) and (not place_meeting(x+hsp,y+1,OneWayObj)))
		{
			y += 1;
		}
	}
	if (place_meeting(x+hsp,y,WallObj) and (not place_meeting(x+hsp,y-2,WallObj)))
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

if grounded and key_up and (place_meeting(x+30,y,BaseNPCObj)){
	control = false
	DialogScript(BaseNPCObj.dialog,0.5)
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
		if (attacking == true){
			sprite_index = PlayerAttackSprite
		}
		else if (dodging == true){
			sprite_index = PlayerBackstepSprite
		}
		
		else if (crouching == true)
		{
			sprite_index = PlayerCrouchSprite
			if PrevSprite == PlayerSlideSprite{
				image_index = 3
			}
			if (image_index == 3) 
			{
				image_speed = 0
			}
		}
		else if (sliding == true){
			sprite_index = PlayerSlideSprite
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
				else if (sprite_index == PlayerBackstepSprite){
					if (image_index == 7){
						sprite_index = PlayerIdleSprite
					}
				}
				else if (sprite_index == PlayerSlideSprite){
					if (image_index == 7){
						sprite_index = PlayerCrouchSprite
					}
				}
				else{
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

//if (PrevSprite != sprite_index) //Frame is reset to 0 if image is changed
//{
//	image_index = 0
//}
