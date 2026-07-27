// --- STEP 1: DESTROY MENU IF FADING ---
if instance_exists(obj_fader) {
    instance_destroy(obj_menusettings);
}

// --- STEP 2: GET CAMERA POSITION ---
_accountx = camera_get_view_x(view_camera[0]);
_accounty = camera_get_view_y(view_camera[0]);

// Reset local triggers for this frame
var _screen_tapped = false;
down_press = 0;
up_press = 0;


// --- STEP 3: MOBILE INPUT CHECK ---
if global.osflavor == "Mobile" {
    var _gui_x = device_mouse_x_to_gui(0);
    var _gui_y = device_mouse_y_to_gui(0);
    var _room_x = device_mouse_x(0);
    var _room_y = device_mouse_y(0);
    
    // Check if player is tapping onscreen overlay buttons
    var _touching_ui = false;
    if instance_exists(obj_a_button) && instance_exists(obj_x_button) && instance_exists(obj_y_button) {
        _touching_ui = position_meeting(_gui_x, _gui_y, obj_a_button) || 
                       position_meeting(_gui_x, _gui_y, obj_x_button) || 
                       position_meeting(_gui_x, _gui_y, obj_y_button);
    }
    
    // Check if player is holding finger on empty background
    if device_mouse_check_button(0, mb_left) {
        if !_touching_ui {
            global.l_held = 1;
            
            // Create target marker if it doesn't exist
            if !instance_exists(obj_mouse_mark) {
                instance_create_layer(_room_x, _room_y, "Instances", obj_mouse_mark);
            }
            
            // Move marker to finger position
            with obj_mouse_mark {
                x = _room_x;
                y = _room_y;
            }
        } else {
            // Holding finger, but touching UI buttons
            global.l_held = 0;
            if instance_exists(obj_mouse_mark) { 
                instance_destroy(obj_mouse_mark); 
            }
        }
    } else {
        // Not pressing screen at all
        global.l_held = 0;
        if instance_exists(obj_mouse_mark) { 
            instance_destroy(obj_mouse_mark); 
        }
    }

    // Check for a new single-frame tap
    if device_mouse_check_button_pressed(0, mb_left) {
        if !_touching_ui {
            global.l_click = 1;
            _screen_tapped = true; 
        } else {
            global.l_click = 0;
        }
    } else {
        global.l_click = 0;
    }
}


// --- STEP 4: PC INPUT FALLBACK ---
if global.osflavor != "Mobile" {
    if global.l_click == 1 {
        _screen_tapped = true;
    }
}


// --- STEP 5: GAMEPAD INPUT CHECK ---
if global.gamepad_id != -1 {
    if gamepad_button_check_pressed(global.gamepad_id, gp_padd) {
        down_press = 1;
    }
    if gamepad_button_check_pressed(global.gamepad_id, gp_padu) {
        up_press = 1;
    }
    if gamepad_button_check_pressed(global.gamepad_id, gp_face1) {
        global.interacted = 1;
    }
    if gamepad_button_check_pressed(global.gamepad_id, gp_face2) {
        global.interacted_x = 1;
    }
}


// --- STEP 6: MENU NAVIGATION (MAIN MENU MODE) ---
if can_change == 1 {
    
    // MOVE CURSOR DOWN
    if _screen_tapped == true || down_press == 1 {
        global.l_click = 0;
        
        box = box + 1;
        if box > 3 { 
            box = 0; 
        }
        
        // Move Undertale menu soul icon vertically
        if instance_exists(obj_menuheart) {
            if box == 0 { 
                obj_menuheart.y = _accounty + 99.5; 
            }
            if box == 1 { 
                obj_menuheart.y = _accounty + 111.5; 
            }
            if box == 2 { 
                obj_menuheart.y = _accounty + 123.5; 
            }
            if box == 3 {
                obj_menuheart.x = _accountx + 32.5;
                obj_menuheart.y = _accounty + 135.5;
            }
        }
        scr_play_snd(snd_movemenu, 1.25, false);
    }
    
    // MOVE CURSOR UP
    if up_press == 1 {
        box = box - 1;
        if box < 0 { 
            box = 3; 
        }
        
        // Move Undertale menu soul icon vertically
        if instance_exists(obj_menuheart) {
            if box == 0 { 
                obj_menuheart.y = _accounty + 99.5; 
            }
            if box == 1 { 
                obj_menuheart.y = _accounty + 111.5; 
            }
            if box == 2 { 
                obj_menuheart.y = _accounty + 123.5; 
            }
            if box == 3 {
                obj_menuheart.x = _accountx + 32.5;
                obj_menuheart.y = _accounty + 135.5;
            }
        }
        scr_play_snd(snd_movemenu, 1.25, false);
    }

    // CONFIRM SELECTION (A Button)
    if global.interacted == 1 {
        global.interacted = 0;
        scr_play_snd(snd_select, 1.25, false);
        
        // ITEM Selected
        if box == 0 {
            show_debug_message("ITEM");
			opened_item = 1
			can_change = 0
			menu_first = 0
        }
        
        // STAT Selected
        else if box == 1 {
            show_debug_message("STAT");
            opened_stat = 1;
            if instance_exists(obj_menuheart) {
                obj_menuheart.y = _accounty + 666; // Hide heart offscreen
            }
            can_change = 0; // Lock main menu navigation
            menu_first = 0; // Prevent backing out completely while viewing stats
        }
        
        // CELL Selected
        else if box == 2 {
            show_debug_message("CELL");
        }
        
        // SETTINGS Selected
        else if box == 3 {
            opened_sett = 1;
            opened_sett_box = 1;
            if instance_exists(obj_menuheart) {
                obj_menuheart.y = _accounty + 88.5;
                obj_menuheart.x = _accountx + 110; 
            }
            can_change = 0;
            menu_first = 0;
            show_debug_message("SETT");
        }
    }
}


// --- STEP 7: MENU NAVIGATION (SUB-MENU STAT & SETTINGS MODE) ---
if can_change != 1 {
    
	if box == 0 {
		if global.interacted_x {
			opened_item = 0
			global.interacted_x = 0
			menu_first = 1
			scr_play_snd(snd_back, 0.65, false);
			can_change = 1
		}
	}
	// Back out of STAT screen
    else if box == 1 {
        if global.interacted_x == 1 {
            if opened_stat == 1 {
                opened_stat = 0;
                global.interacted_x = 0;
                menu_first = 1; // Allow master close to function again
                
                if instance_exists(obj_menuheart) {
                    obj_menuheart.y = _accounty + 111.5; // Put heart back next to STAT
                }
                can_change = 1; // Unlock main menu navigation
                scr_play_snd(snd_back, 0.65, false);
            }
        }
    }
    
    // Back out of SETTINGS screen
    else if box == 3 {
        if global.interacted_x == 1 {
            if opened_sett == 1 {
                opened_sett = 0;
                opened_sett_box = 1;
                global.interacted_x = 0;
                menu_first = 1;
                if instance_exists(obj_menuheart) {
                    obj_menuheart.y = _accounty + 135.5;
                    obj_menuheart.x = _accountx + 32.5;
                }
                can_change = 1;
                scr_play_snd(snd_back, 0.65, false);
            }
        }
    }
}


// --- STEP 8: MASTER QUIT LOGIC (B Button) ---
if global.interacted_x == 1 {
    if menu_first == 1 {
        global.interacted_x = 0; 
        instance_destroy(self); // Closes the entire inventory box
    }
}


// --- STEP 9: SPECIAL SETTINGS SUB-MENU NAVIGATION ---
if opened_sett == 1 {
    
    // MOVE DOWN (Screen Tap / Gamepad Down)
    if _screen_tapped == true || down_press == 1 {
        _screen_tapped = false;
        down_press = 0;
        global.l_click = 0;
        
        if opened_sett_box == 1 {
            scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 103.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 2;
        }
        else if opened_sett_box == 2 {
            scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 118.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 3;
        }
        else if opened_sett_box == 3 {
            scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 133.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 4;
        }
		else if opened_sett_box == 4 {
			scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 133.5 + 15.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 5;
		}
		else if opened_sett_box == 5 {
			scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 88.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 1;
		}
    }
    
    // MOVE UP (Gamepad Up)
    if up_press == 1 {
        up_press = 0;
        
        if opened_sett_box == 1 {
            scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 103.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 2;
        }
        else if opened_sett_box == 2 {
            scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 118.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 3;
        }
        else if opened_sett_box == 3 {
            scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 133.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 4;
        }
		else if opened_sett_box == 4 {
			scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 133.5 + 15.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 5;
		}
		else if opened_sett_box == 5 {
			scr_play_snd(snd_movemenu, 1.25, false);
            obj_menuheart.y = _accounty + 88.5;
            obj_menuheart.x = _accountx + 110; 
            opened_sett_box = 1;
		}
    }

    // TOGGLE SETTINGS SELECTIONS
    if opened_sett_box == 1 {
        if global.interacted == 1 {
            global.interacted = 0;
            scr_play_snd(snd_select, 1.25, false);
            global.autorun = !global.autorun;
            show_debug_message("toggle?? ar");
        }
    }
    else if opened_sett_box == 2 {
        if global.interacted == 1 {
            global.interacted = 0;
            scr_play_snd(snd_select, 1.25, false);
            global.debug = !global.debug;
            show_debug_message("toggle?? debug");
        }
    }
    else if opened_sett_box == 3 {
        if global.interacted == 1 {
			if global.osflavor != "Mobile" {
	            global.interacted = 0;
	            scr_play_snd(snd_select, 1.25, false);
	            global.is_fs = !global.is_fs;
	            if global.is_fs {
	                window_set_fullscreen(true);
	            }
	            else {
	                window_set_fullscreen(false);
	            }
	            show_debug_message("toggle?? fs");
			}
			else {
				scr_play_snd(snd_cantselect, 1.55, false);
			}
        }
    }
	else if opened_sett_box == 4 {
		
		if global.interacted == 1 {
			global.interacted = 0
			if global.osflavor != "Mobile"  {
				if sel = 0 { // 0 is 60
					game_set_speed(120,gamespeed_fps)
					sel = 1
					scr_play_snd(snd_select, 1.25, false);
					global.interacted = 0
				}
				else if sel = 1 { // 1 is 120
					game_set_speed(30,gamespeed_fps)
					scr_play_snd(snd_select, 1.25, false);
					sel = 2
					global.interacted = 0
				}
				else if sel = 2 { 
					game_set_speed(60,gamespeed_fps)
					scr_play_snd(snd_select, 1.25, false);
					sel = 0
					global.interacted = 0
				}
			}
			else {
				scr_play_snd(snd_cantselect, 1.55, false);
			}
		}
		
	}
	else if opened_sett_box == 5 {
		if global.interacted == 1 {
			scr_play_snd(snd_select, 1.25, false);
			sel = 0
			global.interacted = 0
			global.no_mus = !global.no_mus
		}
	}
}