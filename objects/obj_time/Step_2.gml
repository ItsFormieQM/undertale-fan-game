// --- 1. MOUSE / TOUCH TRACKING CONTROLLER ---
if (global.osflavor == "PC") {
    // Clean Fullscreen Toggle Bug Fix
    if (keyboard_check_pressed(vk_f4)) {
        global.is_fs = !global.is_fs;
        window_set_fullscreen(global.is_fs);
    }
    
    // Running Speed Toggles
    if (keyboard_check(ord("X"))) {
        global.sp = 2.5;
        global.spdex = 1.5;
    } else {
        global.sp = 2;
        global.spdex = 1;
    }
    
    // FIXED: Only check button positions if those instances actually exist in the current room
    var _touching_ui = false;
    if (instance_exists(obj_a_button) && instance_exists(obj_x_button) && instance_exists(obj_y_button)) {
        touch_x = device_mouse_x_to_gui(0);
        touch_y = device_mouse_y_to_gui(0);
        _touching_ui = position_meeting(touch_x, touch_y, obj_a_button) || 
                       position_meeting(touch_x, touch_y, obj_x_button) || 
                       position_meeting(touch_x, touch_y, obj_y_button);
    }
    
    // PC Mouse Movement Tracking
    if (device_mouse_check_button(0, mb_left) && !_touching_ui) {
        global.l_held = 1;
        if (!instance_exists(obj_mouse_mark)) {
            instance_create_layer(mouse_x, mouse_y, "Instances", obj_mouse_mark);
        }
        with (obj_mouse_mark) {
            x = mouse_x;
            y = mouse_y;
        }
    } else {
        global.l_held = 0;
        if (instance_exists(obj_mouse_mark)) {
            instance_destroy(obj_mouse_mark);
        }
    }
    
    // PC Click and Keyboard Event Resets
    global.l_click = mouse_check_button_pressed(mb_left) ? 1 : 0;
    global.interacted_x = keyboard_check_pressed(ord("X")) ? 1 : 0;
    global.interacted = keyboard_check_pressed(ord("Z")) ? 1 : 0;
    
    // PC C-Menu Toggling
    if (keyboard_check_pressed(ord("C"))) {
        if (global.interacted_c == 0) {
            global.interacted_c = 1;
            alarm[0] = 3;
        } else {
            global.interacted_c = 0;
            if (instance_exists(obj_menusettings)) {
                instance_destroy(obj_menusettings);
            }
        }
    }
    
    // PC X-Menu Cancellation Check
    if (global.interacted_x == 1) {
        if (instance_exists(obj_menusettings)) {
            if (obj_menusettings.menu_first == 1) {
                global.interacted_x = 0;
                instance_destroy(obj_menusettings);
            }
        }    
    }
}
else if (global.osflavor == "Mobile") {
    // 1. Get separate screen glass coordinates (for UI) and room coordinates (for movement)
    var _gui_x = device_mouse_x_to_gui(0);
    var _gui_y = device_mouse_y_to_gui(0);
    var _room_x = device_mouse_x(0);
    var _room_y = device_mouse_y(0);
    var _is_pressing = device_mouse_check_button(0, mb_left);
    
    // 2. SCREEN CHECK: Check if the finger is over ANY of your UI buttons on the glass layer
    var _touching_ui = position_meeting(_gui_x, _gui_y, obj_a_button) || 
                       position_meeting(_gui_x, _gui_y, obj_x_button) || 
                       position_meeting(_gui_x, _gui_y, obj_y_button);
    
    // 3. Only run movement if pressing down AND the finger is NOT on top of any UI elements
    if (_is_pressing && !_touching_ui) {
        global.l_held = 1;
        if (!instance_exists(obj_mouse_mark)) {
            instance_create_layer(_room_x, _room_y, "Instances", obj_mouse_mark);
        }
        with (obj_mouse_mark) {
            x = _room_x;
            y = _room_y;
        }
    } else {
        global.l_held = 0;
        if (instance_exists(obj_mouse_mark)) {
            instance_destroy(obj_mouse_mark);
        }
    }
    
    // 4. MOBILE C-MENU TOGGLE (Using global.interacted_c managed by obj_y_button layout script)
    if (global.interacted_c == 1) {
        if (!instance_exists(obj_menusettings)) {
            // If menu does not exist, spawn it via your traditional controller framework
            
            alarm[0] = 3; 
        } else {
            // If menu already exists, destroy it to close the layout panel cleanly
            global.interacted_c = 0;
            instance_destroy(obj_menusettings);
        }
        // Force the input tracker clear state instantly so it triggers as a one-frame press event
        global.interacted_c = 0; 
    }
    
    // Mobile X-Menu Cancellation Check
    if (global.interacted_x == 1) {
        if (instance_exists(obj_menusettings)) {
            if (obj_menusettings.menu_first == 1) {
                global.interacted_x = 0;
                instance_destroy(obj_menusettings);
            }
        }    
    }
}

// --- 2. ROOM STARTUP SPAWNER ---
if (room == room_ruin && instance_exists(obj_start)) {
    obj_mainchara.x = obj_start.x;
    obj_mainchara.y = obj_start.y;
    instance_destroy(obj_start);
}


scr_genocide_init()