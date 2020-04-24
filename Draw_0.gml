
// OPTIONS MENU
sel_x_space = -770;
sel_y_space = -218;
space = 171;

// START MENU
sel_x_space2 = -320;
sel_y_space2 = -120;
space2 = 101;

// PAGE VARIABLE
var ds_grid = menu_pages[page];

// LOGO VARIABLES
logo_x =  120;
logo_y = -635;

// OPTIONS MENU BACK
op_x = -260;
op_y = -390;


if (ds_grid = 0) {
	draw_sprite(Menu_logo_Spr, 0, x + logo_x, y + logo_y)
	draw_sprite(Menu_Sel_Arrow_Spr, 0, x + sel_x_space2, y + sel_y_space2 + menu_option[page] * space2);
} else {
	draw_sprite(Options_Menu_Spr, 0, x + op_x, y + op_y)
	draw_sprite(Menu_Sel_Arrow_Spr, 0, x + sel_x_space, y + sel_y_space + menu_option[page] * space);
}

