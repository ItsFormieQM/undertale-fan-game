function scr_framerate_balancer(){
	global.frame_rate = game_get_speed(gamespeed_fps);
	global.sp = 2
	global.spdex = 0.85
	//
	
	if global.frame_rate == 30 {
		global.sp = global.sp * 2
		//global.spdex = global.spdex * 2
		if global.autorun == true || keyboard_check(ord("X")){
			global.sp = 2.5 * 2;
			global.spdex = 1.5;
			//show_debug_message("fast asf")
		}
		if global.gamepad_id != -1 && gamepad_button_check(global.gamepad_id, gp_face3) {
			global.sp = 2.5 * 2;
			global.spdex = 1.5;
			//show_debug_message("fast asf")
		}
	}
	else if global.frame_rate == 120 {
		global.sp = global.sp / 2
		//global.spdex = global.spdex / 2
		if global.autorun == true || keyboard_check(ord("X")){
			global.sp = 2.5 / 2;
			global.spdex = 1.5;
			//show_debug_message("fast asf")
		}
		if global.gamepad_id != -1 && gamepad_button_check(global.gamepad_id, gp_face3) {
			global.sp = 2.5 / 2;
			global.spdex = 1.5;
			//show_debug_message("fast asf")
		}
	}
	else if global.frame_rate == 60 {
		if global.autorun == true || keyboard_check(ord("X")){
			global.sp = 2.5;
		    global.spdex = 1.5;
			//show_debug_message("fast asf")
		}
		if global.gamepad_id != -1 && gamepad_button_check(global.gamepad_id, gp_face3) {
			global.sp = 2.5;
		    global.spdex = 1.5;
			//show_debug_message("fast asf")
		}
	}
}	