/// @description Insert description here
// You can write your code in this editor

// GLOBAL VARIABLES
global.pause = true;
//global.key_revert = ord("X");
global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right;
global.key_down = vk_down;
global.key_up = vk_up;

text_sound = Menu_Sound_1;
music = Main_MenuMusic_1;
//music_test = Music_Test_1;
//audio_play_sound(Main_MenuMusic_1, 10, false);

// ENUM FOR PAGES
enum menu_page {
	main,
	settings,
	audio,
	//difficulty,
	graphics,
	//controls,
	height
}

// ENUM FOR PAGE TYPES
enum menu_el_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	//main,
	input
}

// CREATE MENU PAGES

ds_menu_main = Create_Menu_Page(
	["NEW GAME",	menu_el_type.script_runner, New_Game],
	["RESUME",		menu_el_type.script_runner, Resume_Game],
	["SETTINGS",	menu_el_type.page_transfer, menu_page.settings], 
	["EXIT",		menu_el_type.script_runner, Exit_Game] 

);


ds_menu_settings = Create_Menu_Page(
	["AUDIO",		menu_el_type.page_transfer, menu_page.audio],
	//["DIFFICULTY",	menu_el_type.page_transfer, menu_page.difficulty], 
	["GRAPHICS",	menu_el_type.page_transfer, menu_page.graphics], 
	//["CONTROLS",	menu_el_type.page_transfer, menu_page.controls], 
	["BACK",		menu_el_type.page_transfer, menu_page.main] 

);

ds_menu_audio = Create_Menu_Page(
	//["MASTER",		menu_el_type.slider, Change_Volume,  1,    [0,1]],
	["SOUNDS",		menu_el_type.slider, Change_Volume,  1,    [0,1]], 
	["MUSIC",		menu_el_type.slider, Change_Volume,  1,    [0,1]],
	["BACK",		menu_el_type.page_transfer, menu_page.settings]

);

/*
ds_menu_difficulty = Create_Menu_Page(
	["ENEMIES",		menu_el_type.shift,	 Change_Difficulty,  0,  ["HARMFULL", "NORMAL", "VICIOUS"]],
	["ALLIES",		menu_el_type.shift, Change_Difficulty,  0,  ["PASSIVE", "NORMAL", "BEAST"]], 
	["BACK",		menu_el_type.page_transfer, menu_page.settings]

);
*/

ds_menu_graphics = Create_Menu_Page(
	["RESOLUTION",		menu_el_type.shift,	Change_Resolution,  0,  ["386 x 216", "768 x 432", "1152 x 648", "1536 x 1152", "1920 x 1080"]],
	["WINDOW MODE",		menu_el_type.toggle, Change_Window_Mode,  1,  ["FULLSCREEN", "WINDOWED"]], 
	["BACK",		menu_el_type.page_transfer, menu_page.settings] 

);

/*
ds_menu_controls = Create_Menu_Page(
	["UP",			menu_el_type.input,	 "key_up",		vk_up],
	["LEFT",		menu_el_type.input,  "key_left",	vk_left], 
	["RIGHT",		menu_el_type.input,  "key_right",	vk_right], 
	["DOWN",		menu_el_type.input,  "key_down",	vk_down], 
	["BACK",		menu_el_type.page_transfer, menu_page.settings]

);
*/

page = 0
menu_pages = [ ds_menu_main, ds_menu_settings, ds_menu_audio, ds_menu_graphics]
//ds_menu_main, ds_menu_difficulty, ds_menu_controls

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++
}

isInputting = false;


//AUDIO GROUP (SHOULD BE IN MASTER/GAME OBJ)
//audio_group_load(audiogroup_music);
//audio_group_load(audiogroup_soundFx);



