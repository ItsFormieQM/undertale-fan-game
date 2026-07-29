// 1. Draw the underlying object sprite normally
draw_self();
var _oldfnt = draw_get_font();
var _oldcol = draw_get_colour();

// 2. Fetch the current tracking positions of your camera view


// 3. Set text rules
draw_set_font(fnt_main_small);
draw_set_colour(c_white);

// 4. Draw the background box frame first
draw_sprite_ext(spr_box, 0, _accountx + 50.5, _accounty + 195, 1.25, 1, 0, c_white, 1);
draw_sprite_ext(spr_box, 0, _accountx + 50.5, _accounty + 120, 1.25, 1.45, 0, c_white, 1);
if opened_stat == 1 {
	draw_sprite_ext(spr_box, 0, _accountx + 175, _accounty + 136, 2.85,3.4,0,c_white,1)
	if scr_next_lv(global.lv) != "Proceed" {
		draw_text(_accountx + 110, _accounty + 45 + 5, "Kris Dreemurr")
	}
	else {
		draw_text(_accountx + 110, _accounty + 45 + 5, "Proceed")
	}
	if scr_next_lv(global.lv) != "Proceed" {
		draw_text(_accountx + 110, _accounty + 45 + 35, "LV  " + string(global.lv))
		draw_text(_accountx + 110, _accounty + 45 + 50, "HP  " + string(global.hp) + "  /  " + string(global.max_hp))
		draw_text(_accountx + 110, _accounty + 45 + 80, "AT   " + string(global.atk) + "  (" + string(global.atk / 10) + ")")
		draw_text(_accountx + 110, _accounty + 45 + 95, "DF   " + string(global.def) + "  (" + string(global.def - 10) + ")")
		draw_text(_accountx + 110 + 75, _accounty + 45 + 80, "EXP: " + string(global.xp))
	}
	else {
		draw_text(_accountx + 110, _accounty + 45 + 35, "Proceed")
		draw_text(_accountx + 110, _accounty + 45 + 50, "Proceed")
		draw_text(_accountx + 110, _accounty + 45 + 80, "Proceed")
		draw_text(_accountx + 110, _accounty + 45 + 95, "Proceed")
		draw_text(_accountx + 110 + 75, _accounty + 45 + 80, "Proceed")
	}
	if scr_next_lv(global.lv) != "Proceed" {
		draw_text(_accountx + 110 + 75, _accounty + 45 + 95, "NEXT: " + string(scr_next_lv(global.lv)))
	}
	else {
		draw_text(_accountx + 110 + 75, _accounty + 45 + 95, "Proceed")
	}
	
}

// 5. FIX: Shift coordinates down to lock the text INSIDE the box boundaries
draw_text(_accountx + 37.5 + 6, _accounty + 85 + 6, "ITEM");
draw_text(_accountx + 37.5 + 6, _accounty + 85 + 18, "STAT");
draw_text(_accountx + 37.5 + 6, _accounty + 85 + 30, "CELL");
draw_text(_accountx + 37.5 + 6, _accounty + 85 + 42, "SETT");
// (X: aligned toward the box interior, Y: dropped down past the top border)
if scr_next_lv(global.lv) != "Proceed" {
	draw_text(_accountx + 21.5, _accounty + 170, "Kris");
}
else {
	draw_text(_accountx + 21.5, _accounty + 170, "Proceed");
}
if scr_next_lv(global.lv) != "Proceed" {
	draw_set_font(fnt_main_small)
	draw_text(_accountx + 21.5, _accounty + 185, "LV      " + string(global.lv));
	draw_text(_accountx + 21.5, _accounty + 185 + 15, "HP      " + string(global.hp));
}
else {
	draw_set_font(fnt_main_small)
	draw_text(_accountx + 21.5, _accounty + 185, "Proceed")
	draw_text(_accountx + 21.5, _accounty + 185 + 15, "Proceed");
}

if opened_sett == 1 {
	draw_sprite_ext(spr_box, 0, _accountx + 175, _accounty + 136, 2.85,3.4,0,c_white,1)
	draw_text(_accountx + 110, _accounty + 45 + 5, "SETTINGS")
	if global.autorun == true {
		draw_text(_accountx + 120, _accounty + 80, "AUTO RUN: True")
	}
	else {
		draw_text(_accountx + 120, _accounty + 80, "AUTO RUN: False")
	}
	if global.debug == false {
		draw_text(_accountx + 120, _accounty + 95 , "DEBUG: False")
	}
	else {
		draw_text(_accountx + 120, _accounty + 95 , "DEBUG: True")
	}
	if global.osflavor != "Mobile" {
		if global.is_fs == true {
			draw_text(_accountx + 120, _accounty + 110 , "FULLSCREEN: True")
		}
		else {
			draw_text(_accountx + 120, _accounty + 110 , "FULLSCREEN: False")
		}
	}
	else {
		draw_set_colour(c_grey)
		draw_text(_accountx + 120, _accounty + 110 , "FULLSCREEN: LOCKED")
		
		draw_set_colour(c_white)
	}
	if global.no_mus == false {
		draw_text(_accountx + 120, _accounty + 125, "MUSIC: True")
	}
	else {
		draw_text(_accountx + 120, _accounty + 125, "MUSIC: False")
	}
	 
	//if global.frame_rate == 30 && global.osflavor != "Mobile"{
	//	draw_text(_accountx + 120, _accounty + 125 , "FPS: 30")
	//}
	//else if global.frame_rate == 60 && global.osflavor != "Mobile" {
	//	draw_text(_accountx + 120, _accounty + 125 , "FPS: 60")
	//}
	//else if global.frame_rate == 120 && global.osflavor != "Mobile" {
	//	draw_text(_accountx + 120, _accounty + 125 , "FPS: 120")
	//}
	//else if global.osflavor == "Mobile" {
	//	draw_set_colour(c_grey)
	//	draw_text(_accountx + 120, _accounty + 125 , "FPS: 60")
	//	draw_set_colour(c_white)
	//}
	
	
}
if opened_item == 1 {
	_offset = 10
	draw_sprite_ext(spr_box, 0, _accountx + 175, _accounty + 136, 2.85,3.4,0,c_white,1)
	draw_text(_accountx + 110 +_offset, _accounty + 50 +1, string(global.item[0]))
	draw_text(_accountx + 110 +_offset, _accounty + 65 +1, string(global.item[1]))
	draw_text(_accountx + 110+_offset, _accounty + 80+1, string(global.item[2]))
	draw_text(_accountx + 110+_offset, _accounty + 95+1, string(global.item[3]))
	draw_text(_accountx + 110+_offset, _accounty + 110+1, string(global.item[4]))
	draw_text(_accountx + 110+_offset, _accounty + 125+1, string(global.item[5]))
	draw_text(_accountx + 110+_offset, _accounty + 140+1, string(global.item[6]))
	draw_text(_accountx + 110+_offset, _accounty + 155+1, string(global.item[7]))
	draw_text(_accountx + 110+_offset, _accounty + 155 + 15+1, string(global.item[8]))
	draw_text(_accountx + 110+_offset, _accounty + 155 + 15 * 2+1, string(global.item[9]))
	draw_text(_accountx + 110+_offset, _accounty + 155 + 15 * 3+1, string(global.item[10]))
	//draw_text(_accountx + 110+_offset, _accounty + 155 + 15 * 4, string(global.item[11]))
	//draw_text(_accountx + 110, _accounty + 155 + 15 * 5, string(global.item[12]))
	//draw_text(_accountx + 110, _accounty + 155 + 15 * 6, string(global.item[13]))
	//draw_text(_accountx + 110, _accounty + 155 + 15 * 7, string(global.item[14]))
	//draw_text(_accountx + 110, _accounty + 110, string(global.item[4]))
}

// 6. Restore system states
draw_set_font(_oldfnt);
draw_set_colour(_oldcol);
