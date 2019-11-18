hInput = Kc(vk_right) - Kc(vk_left);
vInput = Kc(vk_down) - Kc(vk_up);
input_run = Kc(vk_shift);
input_Interact = Kcp(ord("E"));
//input_Status = Kcp(ord(vk_enter));

// Reset Movement Variables
moveX = 0;
moveY = 0;

// Alter Speed
if (input_run) {
	spd = r_spd;
	image_speed = .5;
} else {
	spd = 3;
	image_speed = .5;
}


//Intended Movement
if(hInput != 0 or vInput != 0) {
	dir = point_direction(0,0,hInput,vInput);

	moveX = lengthdir_x(spd, dir);
	moveY = lengthdir_y(spd, dir);



if (!can_move) exit;

//------------Collisions

//Horizontal Collision
if(moveX != 0) {
	if (place_meeting(x+moveX, y, Solid_Obj)) {
		repeat (abs (moveX)) {
			if (!place_meeting(x+sign(moveX), y, Solid_Obj)) {
				x += sign(moveX);
			} else {
				break;
			}
		}
		moveX = 0
	}
}

//Vertical Collision
if(moveY != 0) {
	if (place_meeting(x, y+moveY, Solid_Obj)) {
		repeat (abs (moveY)) {
			if (!place_meeting(x, y+sign(moveY), Solid_Obj)) {
				y += sign(moveY);
			} else {
				break;
			}
		}
		
		moveY = 0
	}
}


/*
// Check For Battle Encounter
var rng = irandom(steps)
if (rng == steps) && (steps <= 850) {
		room_goto(Forest_Battle_Rm_1);
	} else {
	 steps -= 1;
	}


*/


// Room Transitions
var inst = instance_place(x,y, Transition_Obj);
if (inst != noone) {
	with (Game_Obj) {
		if (!doTransition) {
			spawnRoom = inst.targetRoom;
			spawnX = inst.targetX;
			spawnY = inst.targetY;
			doTransition = true;
		}
	}
}

// TextBox
if(input_Interact){
	if (active_textbox == noone) {
		var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, Sign_Obj, false, false);
	
			if(inst != noone) {
				with(inst) {
				var tbox = Textbox(text, speakers);
				can_move = false;
				moveX = 0; moveY = 0;
			}
			active_textbox = tbox;
		}
	} else {
		if (!instance_exists(active_textbox)){
			active_textbox = noone;
		}
	}
}


// Apply Movement
	x += moveX;
	y += moveY;
	
	//Set Sprite
	if (room != Forest_Battle_Rm_1 && can_move) {
		switch(dir) {
			case 0: sprite_index = Pahn_Walk_Right_Spr; break;
			case 90: sprite_index = Pahn_Walk_Back_Spr; break;
			case 270: sprite_index = Pahn_Walk_Front_Spr; break;
			case 180: sprite_index = Pahn_Walk_Left_Spr; break;
		}
	}
	} else {
			image_index = 0;
	}











