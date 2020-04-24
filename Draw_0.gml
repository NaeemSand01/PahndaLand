


if (pahnRight) {
	draw_sprite(PahnW_Right, -1, x,y)
} else if (pahnLeft) {
	draw_sprite(PahnW_Left, -1, x,y)	
} else if (pahnBack) {
	draw_sprite(PahnW_Back, -1, x,y)	
} else if (pahnFront) {
	draw_sprite(PahnW_Front, -1, x,y)
} else {

 draw_sprite(pahnSpr, -1, x,y)
}



//// GET HORIZONTAL AND VERTICAL MOVEMENT
//hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
//vInput = keyboard_check(vk_down) - keyboard_check(vk_up);
//shiftInput = keyboard_check(vk_shift);


//if (shiftInput) {
//	spd = u_spd;
//} else {
//	spd = 4.5;
	
//}

//moveX = 0;
//moveY = 0;

//// MOVE CHARACTER ON KEY PRESS
//if (hInput != 0 or vInput != 0) {
//	var dir = point_direction(0, 0, hInput, vInput)
//	moveX = lengthdir_x(spd, dir);
//	moveY = lengthdir_y(spd, dir);



//// COLLISION CHECK

//	//HORIZONTAL
//	if (place_meeting(x + moveX, y, Solid_Obj)) {
//		repeat(abs(moveX)) {
//			if (!place_meeting(x+sign(moveX), y, Solid_Obj)) { x += sign(moveX); } 
//			else { break;}}	moveX = 0; }
	
	
//	//VERTICAL
//	if (place_meeting(x , y + moveY, Solid_Obj)) {
//		repeat(abs(moveY)) {
//			if (!place_meeting(x, y +sign(moveX), Solid_Obj)) { y += sign(moveY); } 
//			else { break;}}	moveY = 0; }


//	// APPLY MOVEMENT
//	x += moveX;
//	y += moveY;
	
//	// SET SPRITE ACCORDING TO DIRECTION
//	switch(dir) {
//		case 0:		draw_sprite(PahnW_Right, -1, x,y); break;
//		case 90:	draw_sprite(PahnW_Back, -1, x,y); break;
//		case 180:	draw_sprite(PahnW_Left, -1, x,y); break;
//		case 270:	draw_sprite(PahnW_Front, -1, x,y); break;
//	}
	
//} else {
	
	
//	// SET SPRITE TO FIRST INDEX OF IDLE EACH DIRECTION
//	if (PahnW_Front and moveX == 0 and moveY == 0) {
//		draw_sprite(PahnIID_Front, -1, x,y);
//	}
//	 else if (PahnW_Right and moveX == 0 and moveY == 0) {
//		draw_sprite(PahnID_Right, -1, x,y);
//	} 
//	//else if (sprite_index = PahnW_Left and moveX == 0 and moveY == 0) {
//	//	draw_sprite(PahnID_Left, -1, x,y);
//	//} else if (sprite_index = PahnW_Back and moveX == 0 and moveY == 0) {
//	//	draw_sprite(PahnID_Back, -1, x,y);
//	//} 
//	else {
//		image_index = 0;
//	}

//}
