
var _screen_tapped = false;


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
           
            
            // Move marker to finger position
            with obj_mouse_mark {
                x = _room_x;
                y = _room_y;
            }
        } else {
            // Holding finger, but touching UI buttons
            global.l_held = 0;
            
        }
    } else {
        // Not pressing screen at all
        global.l_held = 0;
       
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