// MOVE THROUGH MENU

if (!global.pause) exit;

inputUp_p = Kcp(global.key_up);
inputDown_p = Kcp(global.key_down);
inputEnter_p = Kcp(global.key_enter);
//inputRev_p = Kcp(global.key_revert);


var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid)


if (isInputting) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case menu_el_type.shift: 
				var hInput = Kcp(global.key_right) - Kcp(global.key_left);
				if (hInput != 0) {
					//Audio effect
					ds_grid[# 3, menu_option[page]] += hInput;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]]) - 1);
				}
			break;
		case menu_el_type.slider:
				switch(menu_option[page]) {
					//case 0: if(!audio_is_playing(music_test)) { audio_play_sound(music_test, 5, false); } break;
					case 0: if(!audio_is_playing(text_sound)) { audio_play_sound(text_sound, 5, false); } break;
					case 1: if(!audio_is_playing(music)) { audio_play_sound(music, 5, false); } break;
				}
		
				var hInput = keyboard_check(global.key_right) - keyboard_check(global.key_left);
				if (hInput != 0) {
					//Audio effect
					ds_grid[# 3, menu_option[page]] += hInput * 0.01;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
					script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
				}
			break;
		case menu_el_type.toggle:
				var hInput = Kcp(global.key_right) - Kcp(global.key_left);
				if (hInput != 0) {
					//Audio effect
					ds_grid[# 3, menu_option[page]] += hInput;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				}
			break;
		case menu_el_type.input:
				var bb = keyboard_lastkey;
				if (bb != vk_enter) {
					if (bb != ds_grid[# 3, menu_option[page]]) //audio
					ds_grid[# 3, menu_option[page]] = bb;
					variable_global_set(ds_grid[# 2, menu_option[page]], bb);
				}
			break;
	}

} else {
	var oChange = inputDown_p - inputUp_p;
	if(oChange != 0) {
		menu_option[page] += oChange;
		audio_play_sound(text_sound, 5, false)
		if(menu_option[page] > ds_height -1) { menu_option[page] = 0; }
		if (menu_option[page] < 0) { menu_option[page] = ds_height - 1;	}
	}

}


if (inputEnter_p) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case menu_el_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
		case menu_el_type.page_transfer: page = ds_grid[# 2, menu_option[page]] break;
		case menu_el_type.shift:
		case menu_el_type.slider:
		case menu_el_type.toggle: if(isInputting) { script_execute( ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
		case menu_el_type.input:
		isInputting = !isInputting;
			break;
	}
	
	audio_play_sound(text_sound, 5, false);
}