// 1. Track where the finger is pressing on the glass surface
global.interacted_c = 0
var _touch_x = device_mouse_x_to_gui(0);
var _touch_y = device_mouse_y_to_gui(0);
var _touch_active = device_mouse_check_button(0, mb_left);

// 2. COLLISION CHECK: Handle interaction state toggles
if (_touch_active && position_meeting(_touch_x, _touch_y, id)) {
    if (button_unlocked == true) {
        global.interacted_c = 1; 
        button_unlocked = false;
    }
} else {
    if (button_unlocked == false) {
        button_unlocked = true;
    }
}
