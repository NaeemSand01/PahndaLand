
if (!global.pause) exit;

var gWidth = 1536, gHeight = 1152;
var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid)
var y_buffer = 165, x_buffer = 520;
var oy_buffer = 165, ox_buffer = 360;
var sy_buffer = 100, sx_buffer = 80;
var start_y = (gHeight/2) - ((((ds_height - 1)/2) * y_buffer)), start_x = gWidth/2;




// Draw Pause Menu "Back"
var c = c_yellow;
var c3 = c_yellow;
draw_sprite(Options_Menu_Spr,-1,gWidth,gHeight)


// Draw Elements on the Left side
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if (ds_grid = 0) {
	var ltx = start_x - sx_buffer, lty;

	var yy = 0; 

	repeat(ds_height) {
		lty = start_y + 190 + (yy * sy_buffer);
		draw_set_color(c_yellow)
		draw_set_font(Start_Menu_Txt);
		if(yy == menu_option[page]) {
			draw_set_color(c_ltgray);
		}
		draw_text(ltx, lty, ds_grid[# 0, yy]);
		yy++;
	
	}
} else {

	var ltx = start_x - x_buffer, lty;

	var yy = 0; 

	repeat(ds_height) {
		lty = start_y + (yy * y_buffer);
		draw_set_color(c_yellow)
		draw_set_font(Start_Menu_Txt);
		if(yy == menu_option[page]) {
			draw_set_color(c_ltgray);
		}
		draw_text(ltx, lty, ds_grid[# 0, yy]);
		yy++;
	
	}
}


// Draw Elements on the Right Side
draw_set_halign(fa_right);
draw_set_valign(fa_middle);

var rtx = start_x + ox_buffer, rty;
yy = 0;
repeat(ds_height) {
		rty = start_y + (yy * oy_buffer);
	
	// SWITCH CASE FOR MENU TYPES
		switch(ds_grid[# 1, yy]) {
		
		// MENU SHIFT TYPES
		case menu_el_type.shift:
			var currVal = ds_grid[# 3, yy];
			
			var currArr = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			
			c3 = c_yellow;
			if (isInputting and yy == menu_option[page]) { c3 = c_dkgray; }
			if(currVal == 0) left_shift = "";
			if (currVal == array_length_1d(ds_grid[# 4, yy]) -1) right_shift = "";
			draw_text_color(rtx, rty, left_shift + currArr[currVal] + right_shift, c3,c3,c3,c3, 1)
			break;
		
		// MENU SLIDER TYPES
		case menu_el_type.slider:
			var len = 64;
			var currArr = ds_grid[# 4, yy];
			var currVal = ds_grid[# 3, yy];
			var circPos = ((currVal - currArr[0]) / (currArr[1] - currArr[0])) 
			c = c_yellow;
			draw_line_width(rtx  -450, rty, rtx + len - 290, rty, 4);
			
			if (isInputting and yy == menu_option[page]) { c = c_dkgray; }
			draw_circle_color(rtx - 300 + (circPos * len), rty, 15, c,c, false)
			draw_text_color(rtx - 130 + (len * 1.2), rty, string(floor(circPos * 100)) + "%", c,c,c,c, 1);
			break;
			
		// MENU TOGGLE TYPES
		case menu_el_type.toggle:
			var currVal = ds_grid[# 3, yy];
			var c1, c2;
			//if (isInputting and yy == menu_option[page]) { c = c_dkgray; }
			
			if (currVal == 0) { 
				c1 = c; c2 = c_dkgray; 
				} else { 
					c1 = c_dkgray; c2 = c  
					}
			draw_text_color(rtx - 220, rty, "ON", c1,c1,c1,c1, 1);
			draw_text_color(rtx - 90, rty, "OFF", c2,c2,c2,c2, 1);
			break;
			
		// MENU INPUT TYPES
		case menu_el_type.input:
			var currVal = ds_grid[# 3, yy];
			var stringVal;
			
			switch (currVal) {
					case vk_up:		stringVal = "UP KEY"		break;
					case vk_left:	stringVal = "LEFT KEY"		break;
					case vk_right:	stringVal = "RIGHT KEY"		break;
					case vk_down:	stringVal = "DOWN KEY"		break;
					default:		stringVal = chr(currVal);	break;
				}
				
				c = c_yellow;
				if (isInputting and yy == menu_option[page]) { c = c_dkgray; }
				draw_text_color(rtx, rty, stringVal, c,c,c,c, 1);
			break		
	}
	yy++
}

draw_set_valign(fa_top);









