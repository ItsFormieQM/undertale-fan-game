// Initialize active scheme tracker globally if it doesn't exist yet
scr_balance_stats()
if global.frozen == true {
	image_speed = 0
}
if (!variable_global_exists("using_gamepad")) global.using_gamepad = false;

// --- STEP 1: HARDWARE & INPUT STATE DETECTION ---

// 1. Scan for active physical gamepad input
var _gamepad_input_detected = false;
var _active_pad_slot = -1;

for (var i = 0; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        var _axis_h = gamepad_axis_value(i, gp_axislh);
        var _axis_v = gamepad_axis_value(i, gp_axislv);
        
        var _stick_moved = (abs(_axis_h) > 0.2 || abs(_axis_v) > 0.2);
        var _btn_pressed = gamepad_button_check(i, gp_face1) 
                        || gamepad_button_check(i, gp_face2) 
                        || gamepad_button_check(i, gp_face3) 
                        || gamepad_button_check(i, gp_face4)
                        || gamepad_button_check(i, gp_padu) 
                        || gamepad_button_check(i, gp_padd) 
                        || gamepad_button_check(i, gp_padl) 
                        || gamepad_button_check(i, gp_padr);
        
        if (_stick_moved || _btn_pressed) {
            _gamepad_input_detected = true;
            _active_pad_slot = i;
            break;
        }
    }
}

// 2. Scan for active Touch or Mouse input
var _touch_input_detected = mouse_check_button_pressed(mb_left) || global.l_held == 1;

// 3. Dynamic Mode Switching
if (_gamepad_input_detected) {
    global.using_gamepad = true;
    global.gamepad_id = _active_pad_slot;
    gamepad_set_axis_deadzone(_active_pad_slot, 0.2);
} 
else if (_touch_input_detected) {
    global.using_gamepad = false;
}

// --- STEP 2: DYNAMIC TOUCH UI LIFECYCLE ---

if (global.using_gamepad) {
    // Player used gamepad -> Hide Touch UI
    if (instance_exists(obj_a_button)) instance_destroy(obj_a_button);
    if (instance_exists(obj_x_button)) instance_destroy(obj_x_button);
    if (instance_exists(obj_y_button)) instance_destroy(obj_y_button);
} 
else if (global.osflavor == "Mobile" || global.osflavor == "Switchroot Android") {
    // Player touched screen -> Restore Touch UI
    if (!instance_exists(obj_a_button) && !instance_exists(obj_x_button) && !instance_exists(obj_y_button)) {
        var _inst_a = instance_create_layer(450, 420, "Instances", obj_a_button);
        var _inst_x = instance_create_layer(510, 340, "Instances", obj_x_button);
        var _inst_y = instance_create_layer(570, 420, "Instances", obj_y_button);

        _inst_a.image_xscale = 2;
        _inst_a.image_yscale = 2;
        
        _inst_x.image_xscale = 2;
        _inst_x.image_yscale = 2;
        
        _inst_y.image_xscale = 2;
        _inst_y.image_yscale = 2;
    }
}

// --- STEP 3: MOVEMENT INPUT COLLECTION ---
var _target = 0;
if (instance_exists(obj_mouse_mark) && global.canmove == true) {
    _target = obj_mouse_mark;
}

var _gp_h = 0;
var _gp_v = 0;

if (global.using_gamepad && global.gamepad_id != -1) || global.osflavor == "PC" {
    var _axis_h = gamepad_axis_value(global.gamepad_id, gp_axislh);
    var _axis_v = gamepad_axis_value(global.gamepad_id, gp_axislv);
    
    if (abs(_axis_h) > 0.2) _gp_h = _axis_h;
    if (abs(_axis_v) > 0.2) _gp_v = _axis_v;
    
    if (_gp_h == 0 && _gp_v == 0) {
        if (gamepad_button_check(global.gamepad_id, gp_padr) || keyboard_check(ord("D"))) _gp_h = 1;
        if (gamepad_button_check(global.gamepad_id, gp_padl)|| keyboard_check(ord("A"))) _gp_h = -1;
        if (gamepad_button_check(global.gamepad_id, gp_padd)|| keyboard_check(ord("S"))) _gp_v = 1;
        if (gamepad_button_check(global.gamepad_id, gp_padu)|| keyboard_check(ord("W"))) _gp_v = -1;
    }
}

var _gamepad_moving = (_gp_h != 0 || _gp_v != 0);

// --- STEP 4: MOVEMENT EXECUTION & COLLISION ---
// Snap to rest when reaching target
if (instance_exists(obj_mouse_mark) && place_meeting(x, y, obj_mouse_mark) && global.canmove == true && !_gamepad_moving) {
    speed = 0; 
    image_speed = 0;
    image_index = 0;
    instance_destroy(obj_correct_sprite);
}
// Execute movement
else if (((instance_exists(_target) && global.l_held == 1) || _gamepad_moving) && global.canmove == true) {
    
    if (_gamepad_moving && instance_exists(obj_mouse_mark)) {
        instance_destroy(obj_mouse_mark);
    }

    if (!instance_exists(obj_correct_sprite)) {
        instance_create_layer(0, 0, "Instances", obj_correct_sprite);
    }
    
    image_speed = 4.5 * global.spdex;
    
    // Direction calculation
    var _dir = 0;
    if (_gamepad_moving) {
        _dir = point_direction(0, 0, _gp_h, _gp_v);
    } else if (instance_exists(_target)) {
        _dir = point_direction(x, y, _target.x, _target.y);
    }
    
    var _move_speed = global.sp;
    var _hspd = lengthdir_x(_move_speed, _dir);
    var _vspd = lengthdir_y(_move_speed, _dir);
    speed = 0; 

    // Wall Collision & Sliding
    if (!place_meeting(x + _hspd, y + _vspd, obj_solid)) {
        x += _hspd;
        y += _vspd;
    } else {
        if (!place_meeting(x + _hspd, y, obj_solid)) {
            x += _hspd; 
        } else if (!place_meeting(x, y + _vspd, obj_solid)) {
            y += _vspd; 
        } else {
            image_speed = 0;
            image_index = 0;
        }
    }
    
    // Directional Sprites
    var _facing = (((_dir + 45) mod 360) div 90);
    
    switch (_facing) {
        case 0:
            sprite_index = spr_mainchara_r; 
            global.enctimer++;
            break;
        case 1:
            sprite_index = spr_mainchara_u;
            global.enctimer++;
            break;
        case 2:
            sprite_index = spr_mainchara_l; 
            global.enctimer++;
            break;
        case 3:
            sprite_index = spr_mainchara_d; 
            global.enctimer++;
            break;
    }
}
else {
    instance_destroy(obj_correct_sprite);
    speed = 0;
    image_speed = 0;
    image_index = 0;
}

// --- STEP 5: GAMEPAD FACE BUTTON ACTIONS ---
if (global.using_gamepad && global.gamepad_id != -1) {
    if (gamepad_button_check_pressed(global.gamepad_id, gp_face1)) 
		global.interacted = 1;
	else {
		global.interacted = 0

	}
    if (gamepad_button_check_pressed(global.gamepad_id, gp_face3)) 
		global.interacted_x = 1;
	else {
		global.interacted_x = 0
	}
    if (gamepad_button_check_pressed(global.gamepad_id, gp_face4)) 
		global.interacted_c = 1;
	else {
		global.interacted_c = 0
	}
}
