
// GET HORIZONTAL AND VERTICAL MOVEMENT
hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
vInput = keyboard_check(vk_down) - keyboard_check(vk_up);
shiftInput = keyboard_check(vk_shift);


if (shiftInput) {
	spd = u_spd;
} else {
	spd = 4.5;
	
}

moveX = 0;
moveY = 0;

// MOVE CHARACTER ON KEY PRESS
if (hInput != 0 or vInput != 0) {
	dir = point_direction(0, 0, hInput, vInput)
	moveX = lengthdir_x(spd, dir);
	moveY = lengthdir_y(spd, dir);



// COLLISION CHECK

	//HORIZONTAL
	var collisionH = instance_place(x + moveX, y, Solid_Obj)
	show_debug_message(collisionH)
	if (collisionH != noone and collisionH.collidable) {
		show_debug_message(collisionH)
		repeat(abs(moveX)) {
			if (!place_meeting(x+sign(moveX), y, Solid_Obj)) { x += sign(moveX); } 
			else { break;}}	moveX = 0; }
	
	
	//VERTICAL
	var collisionV = instance_place(x , y + moveY, Solid_Obj)
	if (collisionV != noone and collisionV.collidable) {
		repeat(abs(moveY)) {
			if (!place_meeting(x, y +sign(moveX), Solid_Obj)) { y += sign(moveY); } 
			else { break;}}	moveY = 0; }


	// APPLY MOVEMENT
	x += moveX;
	y += moveY;
	
	// SET SPRITE ACCORDING TO DIRECTION
	switch(dir) {
		case 0:		pahnRight = true; pahnBack = false;  pahnLeft = false; pahnFront = false; break;
		case 90:	pahnBack = true; pahnRight = false; pahnLeft = false; pahnFront = false;  break;
		case 180:	pahnLeft = true; pahnBack = false;  pahnRight = false;  pahnFront = false; break;
		case 270:	pahnFront = true; pahnRight = false; pahnBack = false;  pahnLeft = false; break;
	}
	
} else {
	
	// SET SPRITE TO FIRST INDEX OF IDLE EACH DIRECTION
	if (sprite_index = PahnW_Front and moveX == 0 and moveY == 0) {
		sprite_index = PahnIID_Front;
	} else if (sprite_index = PahnW_Right and moveX == 0 and moveY == 0) {
		sprite_index = PahnID_Right;
	} else if (sprite_index = PahnW_Left and moveX == 0 and moveY == 0) {
		sprite_index = PahnID_Left;
	} else if (sprite_index = PahnW_Back and moveX == 0 and moveY == 0) {
		sprite_index = PahnID_Back;
	} else {
		image_index = 0;
	}

}
