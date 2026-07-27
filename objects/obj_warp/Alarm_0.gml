// Fetch the instance ID from the array dynamically using the slot we assigned
//var _my_target = 0
if transition_room == true {
	room_goto(_next_room)
	
}
// Safety check: Make sure the target marker exists in the room layout
if (_my_target != pointer_null && instance_exists(_my_target)) {
    with (obj_mainchara) {
        sprite_index = other.desired_sprite;
    }
    
    // Teleport directly to the marker's coordinates
    obj_mainchara.x = _my_target.x;
    obj_mainchara.y = _my_target.y;
    scr_start_music(_music,_vol,_loop)
    activated = false;
	if global.frame_rate == 60 {
		alarm[2] = 7
	}
	else if global.frame_rate == 120 {
		alarm[2] = 7 * 2
	}
	else if global.frame_rate == 30 {
		alarm[2] = 7 / 2
	}
} else {
    show_debug_message("Error: Warp slot target marker not found!");
}
